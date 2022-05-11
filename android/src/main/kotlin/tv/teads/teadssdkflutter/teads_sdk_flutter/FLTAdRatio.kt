package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FLTAdRatio */
class FLTAdRatio: FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when(call.method){
            "calculateHeight"-> {
                (call.arguments as List<*>).let { args ->
                    val with = args[0] as? Float
                    val requestIdentifier = args[1] as? String
                    if (with != null && requestIdentifier!= null)
                        result.success("ok")
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "value"-> {
                (call.arguments as List<*>).let { args ->
                    val urlString = args[0] as? String
                    if (urlString != null)
                        result.success("ok")
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
