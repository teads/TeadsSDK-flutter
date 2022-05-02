import Flutter
import UIKit
import TeadsSDK

public class FLTTeads: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads", binaryMessenger: registrar.messenger())
    let instance = FLTTeads()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "sdkVersion":
          result(Teads.sdkVersion)
      case "createInReadPlacement":
          if let args = call.arguments as? [Any],
             let pid = args[0] as? Int,
             let settingsMap = args[1] as? [String: Any],
             let data = try? JSONSerialization.data(withJSONObject: settingsMap, options: .prettyPrinted) {
              let decoder = JSONDecoder()
              if let settings = try? decoder.decode(TeadsAdPlacementSettings.self, from: data) {
                  FLTTeadsAdInstanceManager.shared.placement = Teads.createInReadPlacement(pid: pid, settings: settings)
                  result(nil)
              }
          } else {
              result(FlutterError.badArguments)
          }
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
