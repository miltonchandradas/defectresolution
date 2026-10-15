sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"
], (Controller, JSONModel) => {
    "use strict";

    const CONFIG_STORAGE_KEY = "defectresolutionui.reviewConfig.v1";

    function isValidEmailRecipients(value) {
        return typeof value === "string" && !!value.trim() && value.split(",")
            .every((address) => /^[^\s@,;<>]+@[^\s@,;<>]+\.[^\s@,;<>]+$/.test(address.trim()));
    }

    return Controller.extend("defectresolutionui.controller.Master", {
        onInit() {
            const config = { llmModel: "gpt-5.5", maxTokens: 100000, emailTo: "" };
            let storageWarning = "";
            try {
                const saved = JSON.parse(localStorage.getItem(CONFIG_STORAGE_KEY) || "null");
                if (saved && typeof saved === "object") {
                    if (typeof saved.llmModel === "string" && saved.llmModel.trim() && saved.llmModel.trim().length <= 128) {
                        config.llmModel = saved.llmModel.trim();
                    }
                    const maxTokens = Number(saved.maxTokens);
                    if (Number.isInteger(maxTokens) && maxTokens > 0 && maxTokens <= 2147483647) {
                        config.maxTokens = maxTokens;
                    }
                    if (isValidEmailRecipients(saved.emailTo)) {
                        config.emailTo = saved.emailTo.trim();
                    }
                }
            } catch {
                storageWarning = "Saved configuration could not be loaded. Review and save your settings in Edit Config.";
            }
            this.getView().setModel(new JSONModel({
                defectIds: "",
                processType: "S1DM",
                config,
                draftConfig: { ...config },
                hasEmailRecipient: isValidEmailRecipients(config.emailTo),
                llmValueState: "None",
                tokensValueState: "None",
                emailValueState: "None",
                storageError: "",
                valueState: "None",
                busy: false,
                feedback: storageWarning,
                feedbackType: storageWarning ? "Warning" : "Information",
                wbgImage: sap.ui.require.toUrl("defectresolutionui/images/wbg.png"),
                ariaImage: sap.ui.require.toUrl("defectresolutionui/images/aria.png")
            }), "ui");
        },

        onDefectIdsChange(event) {
            const model = this.getView().getModel("ui");
            model.setProperty("/defectIds", event.getParameter("value"));
            model.setProperty("/valueState", "None");
            model.setProperty("/feedback", "");
        },

        onEditConfig() {
            const model = this.getView().getModel("ui");
            model.setProperty("/draftConfig", { ...model.getProperty("/config") });
            model.setProperty("/llmValueState", "None");
            model.setProperty("/tokensValueState", "None");
            model.setProperty("/emailValueState", "None");
            model.setProperty("/storageError", "");
            this.byId("configDialog").open();
        },

        onSaveConfig() {
            const model = this.getView().getModel("ui");
            const draft = model.getProperty("/draftConfig");
            const llmModel = String(draft.llmModel || "").trim();
            const maxTokens = Number(draft.maxTokens);
            const emailTo = String(draft.emailTo || "").trim();
            const invalidModel = !llmModel || llmModel.length > 128;
            const invalidTokens = !Number.isInteger(maxTokens) || maxTokens <= 0 || maxTokens > 2147483647;
            const invalidEmail = !!emailTo && !isValidEmailRecipients(emailTo);
            model.setProperty("/llmValueState", invalidModel ? "Error" : "None");
            model.setProperty("/tokensValueState", invalidTokens ? "Error" : "None");
            model.setProperty("/emailValueState", invalidEmail ? "Error" : "None");
            if (invalidModel || invalidTokens || invalidEmail) {
                return;
            }
            const config = {
                llmModel,
                maxTokens,
                emailTo: emailTo ? [...new Set(emailTo.split(",").map((address) => address.trim()))].join(",") : ""
            };
            try {
                localStorage.setItem(CONFIG_STORAGE_KEY, JSON.stringify(config));
            } catch {
                model.setProperty("/storageError", "Unable to save settings. Allow browser local storage and try again.");
                return;
            }
            model.setProperty("/config", config);
            model.setProperty("/hasEmailRecipient", isValidEmailRecipients(config.emailTo));
            this.byId("configDialog").close();
        },

        onCancelConfig() {
            this.byId("configDialog").close();
        },

        async onSubmit() {
            const model = this.getView().getModel("ui");
            if (model.getProperty("/busy")) {
                return;
            }
            const config = model.getProperty("/config");
            if (!isValidEmailRecipients(config.emailTo)) {
                model.setProperty("/hasEmailRecipient", false);
                this.onEditConfig();
                return;
            }
            const input = String(model.getProperty("/defectIds") || "").trim();
            if (!/^\d+(?:\s*,\s*\d+)*$/.test(input)) {
                model.setProperty("/valueState", "Error");
                this.byId("defectIds").focus();
                return;
            }
            const defectIds = [...new Set(input.split(",").map((value) => value.trim()))].join(",");
            model.setProperty("/defectIds", defectIds);
            model.setProperty("/busy", true);
            model.setProperty("/feedback", "");
            let action;
            try {
                action = this.getOwnerComponent().getModel().bindContext("/triggerDefectOrchestration(...)");
                action.setParameter("defectIds", defectIds);
                action.setParameter("processType", model.getProperty("/processType"));
                action.setParameter("llmModel", config.llmModel);
                action.setParameter("maxTokens", config.maxTokens);
                action.setParameter("emailTo", config.emailTo);
                await action.invoke();
                const response = action.getBoundContext().getObject();
                const results = Array.isArray(response) ? response : response?.value;
                if (!Array.isArray(results) || !results.length) {
                    throw new Error("No results returned for the submitted defects.");
                }
                const completed = results.filter((result) => result.status === "SUCCESS").length;
                const issues = results.filter((result) => result.status !== "SUCCESS")
                    .map((result) => `${result.defectId}: ${result.error || result.status}`);
                model.setProperty("/feedbackType", issues.length ? (completed ? "Warning" : "Error") : "Success");
                model.setProperty("/feedback", issues.length
                    ? `${completed} of ${results.length} completed successfully. ${issues.join("; ")}`
                    : `${completed} ${completed === 1 ? "defect" : "defects"} analyzed successfully.`);
            } catch (error) {
                model.setProperty("/feedbackType", "Error");
                model.setProperty("/feedback", error.message || "Unable to submit defects. Please try again.");
            } finally {
                action?.destroy();
                model.setProperty("/busy", false);
            }
        }
    });
});