//
//  PunkAPIEndpoints.swift
//  Punk
//
//  Created by Aimar Ugarte on 7/3/22.
//

import Foundation

struct PunkAPIEndpoints {
    
    static func fetchBeers(parameters: [String: Any] = [:]) -> Endpoint<[Beer]> {
        return Endpoint(path: "/beers",
                        method: .get,
                        parameters: parameters)
    }
}
