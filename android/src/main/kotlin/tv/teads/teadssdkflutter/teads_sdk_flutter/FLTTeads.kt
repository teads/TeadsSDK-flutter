package tv.teads.teadssdkflutter.teads_sdk_flutter


import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdPlacementSettings
import tv.teads.sdk.TeadsSDK

/** FLTTeads */
class FLTTeads constructor(val context: Context,): FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity



    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when(call.method){
            "createInReadPlacement"->{
                (call.arguments as List<*>).let { args ->
                    val pid = args[0] as? Int
                    val settingsMap = args[1] as? Map<String,Any>
                    if (pid != null && settingsMap != null)
                    {
                        FLTAdInstanceManager.shared.placement = TeadsSDK.createInReadPlacement( context, pid,AdPlacementSettings.fromMap(settingsMap))
                        result.success(null)
                    }
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
        else->result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        return Unit
    }


}
