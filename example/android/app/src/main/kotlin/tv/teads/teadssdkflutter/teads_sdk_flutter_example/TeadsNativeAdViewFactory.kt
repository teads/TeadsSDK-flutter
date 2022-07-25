package tv.teads.teadssdkflutter.teads_sdk_flutter_example

import android.content.Context
import android.view.LayoutInflater
import tv.teads.sdk.renderer.NativeAdView
import tv.teads.teadssdkflutter.teads_sdk_flutter.FLTNativeAdViewFactoryInterface

class TeadsNativeAdViewFactory(private val context: Context?): FLTNativeAdViewFactoryInterface {

    override fun teadsNativeAdView(): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.teads_native_ad_view, null) as NativeAdView



        return nativeAdView
    }
}