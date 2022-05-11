package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdRequestSettings

/** FLTTeadsAdRequestSettings */
class FLTTeadsAdRequestSettings: FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    public var adRequestSettings= AdRequestSettings.Builder()


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when(call.method){
            "enableValidationMode"-> {
                result.success(adRequestSettings.enableValidationMode().build().toMap())
            }
            "pageUrl"-> {
                (call.arguments as List<*>).let { args ->
                    val urlString = args[0] as? String
                    if (urlString != null)
                        result.success(adRequestSettings.pageSlotUrl(urlString).build().toMap())
                    else result.error("", "BadValues", "fill all the fields")
                }
            }
            "addExtras"-> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(adRequestSettings.addExtra(value, key).build().toMap())
                    else result.error("", "BadValues", "fill all the fields")
                }
            }
            else->result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        return Unit
    }
}
