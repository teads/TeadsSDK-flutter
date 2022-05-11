//
//  FLTTeadsAdRatio.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 29/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAdRatio: NSObject, FlutterPlugin {
            
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_ratio", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsAdRatio()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method) {
        case "calculateHeight":
            if let args = call.arguments as? [Any],
               let width = args[0] as? CGFloat,
               let requestIdentifier = args[1] as? String {
                do {
                    result(try FLTTeadsInReadAdInstanceManager.shared.instance(for: requestIdentifier).adRatio.calculateHeight(for: width))
                } catch {
                    result(FlutterError.noAdInstance)
                }
            } else {
                result(FlutterError.badArguments)
            }
        case "value":
            if let args = call.arguments as? [Any],
               let width = args[0] as? CGFloat,
               let requestIdentifier = args[1] as? String {
                do {
                    result(try FLTTeadsInReadAdInstanceManager.shared.instance(for: requestIdentifier).adRatio.value(for: width))
                } catch {
                    result(FlutterError.noAdInstance)
                }
            } else {
                result(FlutterError.badArguments)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
