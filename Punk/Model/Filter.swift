//
//  Filter.swift
//  Punk
//
//  Created by Aimar Ugarte on 28/3/22.
//

import Foundation

public struct Filter: Decodable{
    let filterType: FilterType
    let name: String
    let min: Float?
    let max: Float?
    let startingValue: Float?
    
    enum CodingKeys: String, CodingKey {
        case filterType
        case name
        case min
        case max
        case startingValue
    }
}
