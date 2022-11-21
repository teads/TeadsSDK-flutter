import UIKit
import Flutter
import teads_sdk_flutter
import google_mobile_ads
import teads_admob_adapter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ GADSimulatorID ]
        
        // Register for direct native ad
        let directNativeAdViewFactory = TeadsNativeAdViewFactory()
        FLTTeadsSDKFlutterPlugin.registerNativeAdViewFactory(registry: self, factoryId: "exampleNativeAd", nativeAdViewFactory: directNativeAdViewFactory)
        
        // Register your network extras provider if you want to provide
        // network extras to specific ad requests.
        let networkExtrasProvider = FLTTeadsMediationNetworkExtras()
        FLTGoogleMobileAdsPlugin.register(networkExtrasProvider, registry: self)
        
        // Register for admob native ad
        let admobNativeAdViewFactory = AdMobNativeAdViewFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(self, factoryId: "admobNativeAd", nativeAdFactory: admobNativeAdViewFactory)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    }
}
