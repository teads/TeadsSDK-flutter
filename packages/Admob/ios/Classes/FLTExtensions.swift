//
//  FLTExtensions.swift
//  teads_admob_adapter
//
//  Created by Thibaud Saint-Etienne on 17/10/2022.
//

import Foundation

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}

extension FlutterError {
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
