//
//  FLTExtensions.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Foundation
import Flutter

public extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}

public extension FlutterError {
    static let noAdInstance = FlutterError(
        code: "NO_AD_INSTANCE",
        message: "Unable to find an ad instance",
        details: nil
    )
    
    static let badArguments = FlutterError(
        code: "BAD_ARGS",
        message: "Wrong argument types",
        details: nil
    )
}
