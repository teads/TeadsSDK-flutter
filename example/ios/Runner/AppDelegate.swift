import UIKit
import Flutter
import teads_sdk_flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        let nativeAdViewFactory = TeadsNativeAdViewFactory()
        FLTTeadsSDKFlutterPlugin.registerNativeAdViewFactory(registry: self, factoryId: "exampleNativeAd", nativeAdViewFactory: nativeAdViewFactory)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    }
}
