if setfflag then
	setfflag("CrashUploadToBacktraceUrl", "")
	setfflag("CrashpadUploadToBacktraceUrl", "")
	setfflag("CrashUploadToBacktracePercentage", 0)
	setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
	setfflag("CrashUploadToBacktraceBlackholeToken", "")
	setfflag("DebugCrashEnabled", "False")
	setfflag("GoogleAnalyticsAccountPropertyID", "")
	setfflag("WindowsLaunchTypeAnalytics", "False")
	setfflag("AbuseReportScreenshot", "False")
	setfflag("AbuseReportScreenshotPercentage", 0)
	setfflag("TelegrafHTTPTransportUrl", "")
	setfflag("EnableGCapsHardwareTelemetry", "False")
	setfflag("EnableExtendedHardwareTelemetry", "False")
	setfflag("EnableInferredOOMTelemetry", "False")
	setfflag("EnableHardwareTelemetry", "False")
	setfflag("HardwareTelemetryHundredthsPercent", 0)
end

if getgenv and checkcaller and hookfunction then
	local LocalPlayer = game.Players.PlayerAdded:Wait()
	local PostMessage = require(LocalPlayer:WaitForChild("PlayerScripts", 1/0):WaitForChild("ChatScript", 1/0):WaitForChild("ChatMain", 1/0)).MessagePosted
	getgenv().MessageEvent = Instance.new("BindableEvent")

	local OldFunctionHook
	local PostMessageHook = function(self, msg)
	    if not checkcaller and self == PostMessage then
		MessageEvent:Fire(msg)
		return
	    end
	    return OldFunctionHook(self, msg)
	end
	OldFunctionHook = HookFunction(PostMessage.fire, PostMessageHook)
end
