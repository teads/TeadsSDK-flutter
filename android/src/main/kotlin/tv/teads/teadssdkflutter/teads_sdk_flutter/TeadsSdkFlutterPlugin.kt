package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class TeadsSdkFlutterPlugin : FlutterPlugin {
    private lateinit var adPlacementSettingsChannel: MethodChannel
    private lateinit var adRequestSettingsChannel: MethodChannel
    private lateinit var teadsChannel: MethodChannel
    private lateinit var teadsAdChannel: MethodChannel
    private lateinit var inReadAdViewChannel: MethodChannel
    private lateinit var nativeAdViewChannel: MethodChannel
    private lateinit var inReadAdPlacementChannel: MethodChannel
    private lateinit var nativeAdPlacementChannel: MethodChannel
    private lateinit var adRatioChannel: MethodChannel
    val nativeAdViewFactories: MutableMap<String, FLTNativeAdViewFactoryInterface> = mutableMapOf()

    companion object {
        val shared = TeadsSdkFlutterPlugin()

        fun registerNativeAdViewFactory(
            factoryId: String,
            nativeAdViewFactory: FLTNativeAdViewFactoryInterface
        ): Boolean {
            return if (shared.nativeAdViewFactories[factoryId] != null) {
                Log.e(
                    "TeadsSdkFlutterPlugin",
                    "A NativeAdViewFactory with the following factoryId already exists: $factoryId"
                )
                false
            } else {
                shared.nativeAdViewFactories[factoryId] = nativeAdViewFactory
                true
            }
        }

        fun unregisterNativeAdViewFactory(factoryId: String): FLTNativeAdViewFactoryInterface? {
            val factory = shared.nativeAdViewFactories[factoryId]
            shared.nativeAdViewFactories.remove(factoryId)
            return factory
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        // FLTAdPlacementSettings Handler
        adPlacementSettingsChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_placement_settings"
        )
        adPlacementSettingsChannel.setMethodCallHandler(FLTAdPlacementSettings())

        // FLTAdRequestSettings Handler
        adRequestSettingsChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_request_settings"
        )
        adRequestSettingsChannel.setMethodCallHandler(FLTAdRequestSettings())

        // FLTTeads Handler
        teadsChannel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads")
        teadsChannel.setMethodCallHandler(FLTTeads(flutterPluginBinding.applicationContext))

        // FLTAd Handler
        teadsAdChannel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "teads_sdk_flutter/teads_ad")
        teadsAdChannel.setMethodCallHandler(FLTAd())

        // FLTInReadAdPlacement Handler
        inReadAdPlacementChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_placement/inread"
        )
        inReadAdPlacementChannel.setMethodCallHandler(
            FLTInReadAdPlacement(
                inReadAdPlacementChannel,
                teadsAdChannel
            )
        )

        // FLTInReadAdPlacement Handler
        nativeAdPlacementChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_placement/native"
        )
        nativeAdPlacementChannel.setMethodCallHandler(
            FLTNativeAdPlacement(
                nativeAdPlacementChannel,
                teadsAdChannel
            )
        )

        // FLTAdRatio Handler
        adRatioChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_ratio"
        )
        adRatioChannel.setMethodCallHandler(FLTAdRatio())


        // FLTInReadAdView Handler
        inReadAdViewChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_view/inread"
        )

        val fltInReadAdView = FLTInReadAdView()
        inReadAdViewChannel.setMethodCallHandler(fltInReadAdView)

        flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory(
                "FLTTeadsInReadAdView",
                FLTInReadAdViewFactory(fltInReadAdView)
            )

        // FLTNativeAdView Handler
        nativeAdViewChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "teads_sdk_flutter/teads_ad_view/native"
        )

        flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory(
                "FLTTeadsNativeAdView",
                FLTNativeAdViewFactory(nativeAdViewChannel)
            )

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        adPlacementSettingsChannel.setMethodCallHandler(null)
        adRequestSettingsChannel.setMethodCallHandler(null)
        teadsChannel.setMethodCallHandler(null)
        teadsAdChannel.setMethodCallHandler(null)
        inReadAdViewChannel.setMethodCallHandler(null)
        inReadAdPlacementChannel.setMethodCallHandler(null)
        adRatioChannel.setMethodCallHandler(null)
    }
}
