package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import tv.teads.sdk.renderer.InReadAdView


internal class FLTTeadsInReadAdView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView, MethodChannel.MethodCallHandler {
    private lateinit var inReadAdView: InReadAdView
    private val textView: TextView

    init {
        textView = TextView(context)
        textView.textSize = 72f
        textView.setBackgroundColor(Color.rgb(0, 0, 255))
        textView.text = "Rendered on a native Android view"
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "bind" -> {
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier = args[0] as? String
                    if (requestIdentifier != null) {
                        //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.delegate = self
                        // inReadAdView.bind()
                            inReadAdView.bind(FLTAdInstanceManager.shared.instance())

                    } else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
        }
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }
}
