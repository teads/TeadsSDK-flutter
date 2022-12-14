package tv.teads.teadsadmobadapter.teads_admob_adapter

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import tv.teads.sdk.AdPlacementExtraKey
import tv.teads.sdk.TeadsMediationSettings
import tv.teads.sdk.plugin.PluginType
import tv.teads.sdk.renderer.MediaScale
import tv.teads.sdk.utils.userConsent.TCFVersion
import tv.teads.teadssdkflutter.teads_sdk_flutter.PluginException
import tv.teads.teadssdkflutter.teads_sdk_flutter.error

class FLTTeadsAdapterSettings : MethodChannel.MethodCallHandler {

    companion object {
        val instance by lazy { FLTTeadsAdapterSettings() }
    }

    internal var mediationSettingsBuilder = TeadsMediationSettings.Builder()

    init {
        mediationSettingsBuilder.addExtra(AdPlacementExtraKey.PLUGIN, PluginType.FLUTTER)
        mediationSettingsBuilder.addExtra(AdPlacementExtraKey.PLUGIN_VERSION, "1.0.0")
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "disableCrashMonitoring" -> {
                result.success(mediationSettingsBuilder.disableCrashMonitoring().build().toMap())
            }
            "userConsent" -> {
                (call.arguments as List<*>).let { args ->
                    val subjectToGDPR = args[0] as? String
                    val consent = args[1] as? String
                    val tcfVersion: Int? = args[2] as? Int
                    val cmpSdkId = args[3] as? Int
                    if (subjectToGDPR != null && consent != null && tcfVersion != null && cmpSdkId != null)
                        result.success(
                            mediationSettingsBuilder.userConsent(
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
                            mediationSettingsBuilder.setUsPrivacy(consent).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "addExtras" -> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(
                            mediationSettingsBuilder.addExtra(key, value).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "enableDebug" -> {
                result.success(mediationSettingsBuilder.enableDebug().build().toMap())
            }
            "enableValidationMode" -> {
                result.success(mediationSettingsBuilder.enableValidationMode().build().toMap())
            }
            "pageUrl" -> {
                (call.arguments as List<*>).let { args ->
                    val url = args[0] as? String
                    if (url != null)
                        result.success(
                            result.success(mediationSettingsBuilder.pageSlotUrl(url).build().toMap())
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "setMediaScale" -> {
                (call.arguments as List<*>).let { args ->
                    val mediaScaleInt = args[0] as? Int
                    if (mediaScaleInt != null) {
                        val mediaScale =
                            if (mediaScaleInt == 0) MediaScale.CENTER_CROP else MediaScale.CENTER_INSIDE
                        result.success(
                            result.success(
                                mediationSettingsBuilder.setMediaScale(mediaScale).build().toMap()
                            )
                        )
                    } else result.error(PluginException.BadArguments)
                }
            }
            "addPlacementExtra" -> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(
                            mediationSettingsBuilder.addPlacementExtra(key, value).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "enableLocation" -> {
                result.success(mediationSettingsBuilder.enableLocation().build().toMap())
            }
            "useLightEndScreen" -> {
                result.success(mediationSettingsBuilder.useLightEndScreen().build().toMap())
            }
            "hideBrowserUrl" -> {
                result.success(mediationSettingsBuilder.hideBrowserUrl().build().toMap())
            }
            "toolBarBackgroundColor" -> {
                (call.arguments as List<*>).let { args ->
                    val color = args[0] as? Int
                    if (color != null)
                        result.success(
                            mediationSettingsBuilder.toolBarBackgroundColor(color).build().toMap()
                        )
                    else result.error(PluginException.BadArguments)
                }
            }
            "disableTeadsAudioSessionManagement", "disableBatteryMonitoring" -> {
                // iOS Only
                result.success(mediationSettingsBuilder.build().toMap())
            }
            else -> result.notImplemented()
        }
    }
}
