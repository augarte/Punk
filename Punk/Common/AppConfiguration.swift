//
//  Constants.swift
//  Punk
//
//  Created by Aimar Ugarte on 6/3/22.
//

import Foundation

final class AppConfiguration {
    
    lazy var apiBaseURL: String = {
        return valueFromConfiguration(key: "ApiBaseURL")
    }()
    
    func valueFromConfiguration(key: String) -> String {
        guard let configurationValue = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return configurationValue
    }
}
