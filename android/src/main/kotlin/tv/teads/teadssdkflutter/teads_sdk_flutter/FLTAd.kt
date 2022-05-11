package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FLTAd */
class FLTAd: FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when(call.method){
            "delegate"-> {
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier= args[0] as? String
                    if ( requestIdentifier != null){
                        //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.delegate = self
                        result.success(null)
                        //+ gestion erreur
                    }
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "playbackDelegate"->{
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier= args[0] as? String
                    if ( requestIdentifier != null){
                        //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.playbackDelegate = self
                        result.success(null)
                        //+ gestion erreur
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