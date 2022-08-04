package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.renderer.NativeAdView

interface FLTNativeAdViewFactoryInterface {
    /**
     * Creates a NativeAdView.
     *
     * @return a NativeAdView that is overlaid on top of the FlutterView
     */
    fun teadsNativeAdView(): NativeAdView
}