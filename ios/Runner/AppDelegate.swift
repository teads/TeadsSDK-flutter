import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let registrar = self.registrar(forPlugin: "Teads")
    let factory = TeadsViewFactory(messenger: registrar!.messenger())
    
    registrar?.register(
                factory,
                withId: "TeadsPlatformView")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
