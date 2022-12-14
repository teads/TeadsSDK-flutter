import Flutter
import UIKit

public class FLTTeadsAdmobAdapterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      FLTTeadsAdapterSettings.register(with: registrar)
  }
}
