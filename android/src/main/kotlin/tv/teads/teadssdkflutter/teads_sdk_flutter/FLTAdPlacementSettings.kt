package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdPlacementSettings
import tv.teads.sdk.utils.userConsent.TCFVersion

/** FLTAdPlacementSettings */
class FLTAdPlacementSettings : MethodCallHandler {

    var placementSettingsBuilder = AdPlacementSettings.Builder()

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "disableCrashMonitoring" -> {
                result.success(placementSettingsBuilder.disableCrashMonitoring().build().toMap())
            }
            "disableTeadsAudioSessionManagement" -> {
                //no method in android sdk
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
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "setUsPrivacy" -> {
                (call.arguments as List<*>).let { args ->
                    val consent = args[0] as? String
                    if (consent != null)
                        result.success(
                            placementSettingsBuilder.setUsPrivacy(consent).build().toMap()
                        )
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "disableBatteryMonitoring" -> {
                //no method in android sdk
            }
            "addExtras" -> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(
                            placementSettingsBuilder.addPlacementExtra(value, key).build().toMap()
                        )
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }
}
