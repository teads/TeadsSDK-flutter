package tv.teads.flutter.sampleapp

import android.view.LayoutInflater
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import tv.teads.teadssdkflutter.teads_sdk_flutter.TeadsSdkFlutterPlugin
import tv.teads.teadsadmobadapter.teads_admob_adapter.FLTTeadsMediationInReadNetworkExtras
import tv.teads.teadsadmobadapter.teads_admob_adapter.FLTTeadsMediationNativeNetworkExtras

class MainActivity: FlutterActivity() {

    private val teadsNativeAdFactoryId = "exampleNativeAd"
    private val admobNativeAdFactoryId = "admobNativeAd"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        TeadsSdkFlutterPlugin.registerNativeAdViewFactory(teadsNativeAdFactoryId, TeadsNativeAdViewFactory(context))
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, admobNativeAdFactoryId, AdMobNativeAdViewFactory(LayoutInflater.from(context))
        )
        GoogleMobileAdsPlugin.registerMediationNetworkExtrasProvider(flutterEngine, FLTTeadsMediationInReadNetworkExtras())
        GoogleMobileAdsPlugin.registerMediationNetworkExtrasProvider(flutterEngine, FLTTeadsMediationNativeNetworkExtras())
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)

        TeadsSdkFlutterPlugin.unregisterNativeAdViewFactory(teadsNativeAdFactoryId)
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, admobNativeAdFactoryId)
        GoogleMobileAdsPlugin.unregisterMediationNetworkExtrasProvider(flutterEngine)
    }

}
