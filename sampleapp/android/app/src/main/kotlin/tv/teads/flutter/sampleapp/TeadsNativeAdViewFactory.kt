package tv.teads.flutter.sampleapp

import android.content.Context
import android.view.LayoutInflater
import tv.teads.sdk.renderer.NativeAdView
import tv.teads.teadssdkflutter.teads_sdk_flutter.FLTNativeAdViewFactoryInterface

class TeadsNativeAdViewFactory(private val context: Context?): FLTNativeAdViewFactoryInterface {
    override fun teadsNativeAdView(): NativeAdView {
        return LayoutInflater.from(context)
            .inflate(R.layout.teads_native_ad_view, null) as NativeAdView
    }
}