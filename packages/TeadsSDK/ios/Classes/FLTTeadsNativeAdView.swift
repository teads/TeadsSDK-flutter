//
//  FLTTeadsNativeAdView.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 29/06/2022.
//

import Flutter
import UIKit
import TeadsSDK

@objc
public protocol FLTTeadsNativeAdViewFactoryProtocol {
    /// Creates a `TeadsNativeAdView`.
    /// - returns: A `TeadsNativeAdView` that is overlaid on top of the FlutterView.
    func teadsNativeAdView() -> TeadsNativeAdView?
}

@objc
public class FLTTeadsNativeAdViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    @objc
    public init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLTTeadsNativeAdView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

public class FLTTeadsNativeAdView: NSObject, FlutterPlatformView {
    private var nativeAdView: TeadsNativeAdView?

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        if let args = args as? [String: Any],
           let factoryId = args["factoryId"] as? String {
            nativeAdView = FLTTeadsSDKFlutterPlugin.shared.nativeAdViewFactories[factoryId]?.teadsNativeAdView()
        }
        
        super.init()
        
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_view/native", binaryMessenger: messenger!)
           channel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
               switch(call.method) {
               case "bind":
                   if let args = call.arguments as? [Any],
                      let requestIdentifier = args[0] as? String {
                       if let ad = try? FLTTeadsNativeAdInstanceManager.shared.ad(for: requestIdentifier) {
                           self?.nativeAdView?.bind(ad)
                       }
                       result(nil)
                   } else {
                       result(FlutterError.badArguments)
                   }
               case "dispose":
                   if let args = call.arguments as? [Any],
                      let requestIdentifier = args[0] as? String {
                       FLTTeadsNativeAdInstanceManager.shared.removeInstance(for: requestIdentifier)
                       result(nil)
                   } else {
                       result(FlutterError.badArguments)
                   }
               default:
                   result(FlutterMethodNotImplemented)
               }
           })
    }

    public func view() -> UIView {
        return nativeAdView ?? UIView()
    }
    
}

