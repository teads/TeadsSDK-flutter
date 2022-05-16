package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import tv.teads.sdk.renderer.InReadAdView


internal class FLTTeadsInReadAdView : PlatformView, MethodChannel.MethodCallHandler {
    private lateinit var inReadAdView: InReadAdView

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "bind" -> {
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier = args[0] as? String
                    if (requestIdentifier != null)
                        inReadAdView = FLTAdInstanceManager.shared.instance(requestIdentifier).inReadAdView
                    else
                        result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
        }
    }

    override fun getView(): View {
        return inReadAdView
    }

    override fun dispose() {
        inReadAdView.clean()
    }
}
