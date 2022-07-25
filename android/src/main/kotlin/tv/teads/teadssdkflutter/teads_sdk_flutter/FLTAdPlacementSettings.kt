package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdPlacementSettings
import tv.teads.sdk.utils.userConsent.TCFVersion

class FLTAdPlacementSettings : MethodCallHandler {

    private var placementSettingsBuilder = AdPlacementSettings.Builder()

    init {
//        placementSettingsBuilder.addPlacementExtra(
//            AdPlacementSettings.PLATFORM_KEY,
//            AdPlacementSettings.PLATFORM_FLUTTER
//        ).build()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "disableCrashMonitoring" -> {
                result.success(placementSettingsBuilder.disableCrashMonitoring().build().toMap())
            }
            "disableTeadsAudioSessionManagement" -> {
                // iOS Only
                result.success(placementSettingsBuilder.build().toMap())
            }
            "enableDebug" -> {
                result.success(placementSettingsBuilder.enableDebug().build().toMap())
            }
            "userConsent" -> {
                (call.arguments as List<*>).let { args ->
                    val subjectToGDPR = args[0] as? String
                    val consent = args[1] as? String
                    val tcfVersion: Int? = args[2] as? Int
                    val cmpSdkId = args[3] as? Int
                    if (subjectToGDPR != null && consent != null && tcfVersion != null && cmpSdkId != null)
                        result.success(
                            placementSettingsBuilder.userConsent(
                                subjectToGDPR, consent,
                                TCFVersion.fromInt(tcfVersion), cmpSdkId
                            ).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "setUsPrivacy" -> {
                (call.arguments as List<*>).let { args ->
                    val consent = args[0] as? String
                    if (consent != null)
                        result.success(
                            placementSettingsBuilder.setUsPrivacy(consent).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "disableBatteryMonitoring" -> {
                // iOS Only
                result.success(placementSettingsBuilder.build().toMap())
            }
            "addExtras" -> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(
                            placementSettingsBuilder.addPlacementExtra(value, key).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "enableLocation" -> {
                result.success(placementSettingsBuilder.enableLocation().build().toMap())
            }
            "useLightEndScreen" -> {
                result.success(placementSettingsBuilder.useLightEndScreen().build().toMap())
            }
            "hideBrowserUrl" -> {
                result.success(placementSettingsBuilder.hideBrowserUrl().build().toMap())
            }
            "toolBarBackgroundColor" -> {
                (call.arguments as List<*>).let { args ->
                    val color = args[0] as? Int
                    if (color != null)
                        result.success(
                            placementSettingsBuilder.toolBarBackgroundColor(color).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            else -> result.notImplemented()
        }
    }
}
