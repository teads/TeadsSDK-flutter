import Flutter
import UIKit
import TeadsSDK

public class SwiftTeadsSdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "teads_sdk_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftTeadsSdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "sdkVersion":
          result(Teads.sdkVersion)
      case "createInReadPlacement":
          if let args = call.arguments as? [Any] {
              result(Teads.createInReadPlacement(pid: args[0] as! Int, settings: args[1] as! TeadsAdPlacementSettings, delegate: args[2] as! TeadsInReadAdPlacementDelegate))
          } else {
              result(
                FlutterError.init(
                    code: "BAD_ARGS",
                    message: "Wrong argument types",
                    details: nil
                )
              )
          }
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
