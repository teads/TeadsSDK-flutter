package tv.teads.teadssdkflutter.teads_sdk_flutter


import android.content.Context
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdPlacementSettings
import tv.teads.sdk.TeadsSDK

class FLTTeads constructor(private val context: Context) : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when (call.method) {
            "sdkVersion" -> {
                result.success("")
            }
            "createInReadPlacement" -> {
                (call.arguments as List<*>).let { args ->
                    val pid = args[0] as? Int
                    val settingsMap = args[1] as? Map<String, Any>
                    if (pid != null && settingsMap != null) {
                        FLTTeadsInReadAdInstanceManager.shared.placement =
                            TeadsSDK.createInReadPlacement(
                                context,
                                pid,
                                AdPlacementSettings.fromMap(settingsMap)
                            )
                        result.success(null)
                    } else result.error(PluginException.BadArguments)
                }
            }
            "createNativePlacement" -> {
                (call.arguments as List<*>).let { args ->
                    val pid = args[0] as? Int
                    val settingsMap = args[1] as? Map<String, Any>
                    if (pid != null && settingsMap != null) {
                        FLTTeadsNativeAdInstanceManager.shared.placement =
                            TeadsSDK.createNativePlacement(
                                context,
                                pid,
                                AdPlacementSettings.fromMap(settingsMap)
                            )
                        result.success(null)
                    } else result.error(PluginException.BadArguments)
                }
            }
            else -> result.notImplemented()
        }
    }

}
