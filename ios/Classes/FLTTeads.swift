//
//  FLTExtensions.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

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
                  settings.setFlutterExtras()
                  FLTTeadsInReadAdInstanceManager.shared.placement = Teads.createInReadPlacement(pid: pid, settings: settings)
                  result(nil)
              }
          } else {
              result(FlutterError.badArguments)
          }
      case "createNativePlacement":
          if let args = call.arguments as? [Any],
             let pid = args[0] as? Int,
             let settingsMap = args[1] as? [String: Any],
             let data = try? JSONSerialization.data(withJSONObject: settingsMap, options: .prettyPrinted) {
              let decoder = JSONDecoder()
              if let settings = try? decoder.decode(TeadsAdPlacementSettings.self, from: data) {
                  settings.setFlutterExtras()
                  FLTTeadsNativeAdInstanceManager.shared.placement = Teads.createNativePlacement(pid: pid, settings: settings)
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

extension TeadsAdPlacementSettings {
    func setFlutterExtras() {
        addExtras(TeadsAdPlacementSettings.pluginFlutter, for: TeadsAdPlacementSettings.pluginKey)
         // Fluter version is always 1.0.0
        addExtras("1.0.0", for: TeadsAdPlacementSettings.pluginVersionKey)
    }
}
