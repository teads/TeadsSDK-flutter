package com.example.flutter_app

import android.content.Context
import android.util.Log
import android.view.Gravity
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView
import tv.teads.sdk.android.AdSettings
import tv.teads.sdk.android.CustomAdView
import tv.teads.sdk.android.TeadsListener
import tv.teads.sdk.android.engine.web.UserConsent
import tv.teads.sdk.android.infeed.core.jsEngine.bridges.User

class TeadsViewContainer internal constructor(context: Context, messenger: BinaryMessenger, id: Int, args: Any?)
    : PlatformView, MethodCallHandler, TeadsListener() {

    private val adView: CustomAdView = CustomAdView(context)
    private val methodChannel = MethodChannel(messenger, "TeadsView/$id")

    init {
        methodChannel.setMethodCallHandler(this)
        
        val map = args as Map<String, Any>

        adView.setPid(map["pid"] as Int)
        adView.listener = this
        adView.load(AdSettings.fromMap(map))
    }

    override fun onAdLoaded(adRatio: Float) {
        methodChannel.invokeMethod("OnRatioUpdated", adRatio)
    }

    override fun onRatioUpdated(adRatio: Float) {
        methodChannel.invokeMethod("OnRatioUpdated", adRatio)
    }

    override fun onInputConnectionUnlocked() {

    }

    override fun onFlutterViewDetached() {

    }

    override fun onFlutterViewAttached(flutterView: View) {

    }

    override fun getView(): View {
        return adView
    }

    override fun dispose() {
    }

    override fun onInputConnectionLocked() {
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {}
}