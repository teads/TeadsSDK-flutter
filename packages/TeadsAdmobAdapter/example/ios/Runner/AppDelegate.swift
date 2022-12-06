import UIKit
import Flutter
import google_mobile_ads
import teads_admob_adapter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Register your network extras provider if you want to provide
    // network extras to specific ad requests.
    let networkExtrasProvider = FLTTeadsMediationNetworkExtras()
    FLTGoogleMobileAdsPlugin.register(networkExtrasProvider, registry: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
