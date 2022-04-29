//
//  FLTTeadsAdRequestSettings.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAdRequestSettings: NSObject, FlutterPlugin {
    
    let bridgeInstance = TeadsAdRequestSettings()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_request_settings", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsAdRequestSettings()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "enableValidationMode":
            bridgeInstance.enableValidationMode()
            result(try? bridgeInstance.asDictionary())
        case "pageUrl":
            if let args = call.arguments as? [Any],
               let urlString = args[0] as? String {
                bridgeInstance.pageUrl(urlString)
                result(try? bridgeInstance.asDictionary())
            } else {
                result(
                  FlutterError.init(
                      code: "BAD_ARGS",
                      message: "Wrong argument types",
                      details: nil
                  )
                )
            }
        case "addExtras":
            if let args = call.arguments as? [Any],
               let value = args[0] as? String,
               let key = args[1] as? String {
                bridgeInstance.addExtras(value, for: key)
                result(try? bridgeInstance.asDictionary())
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