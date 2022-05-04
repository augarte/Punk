//
//  Beer.swift
//  Punk
//
//  Created by Aimar Ugarte on 6/3/22.
//

import Foundation

public struct Beer: Decodable{
    let id: Int
    let name: String?
    let tagline: String?
    let first_brewed: String?
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let target_fg: Double?
    let target_og: Double?
    let ebc: Double?
    let srm: Double?
    let ph: Double?
    let attenuation_level: Double?
    let volume: UnitValue?
    let boil_volume: UnitValue?
    let method: Method?
    let ingredients: Ingredient?
    let food_pairing: [String]?
    let brewers_tips: String?
    let contributed_by: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case first_brewed
        case description
        case image_url
        case abv
        case ibu
        case target_fg
        case target_og
        case ebc
        case srm
        case ph
        case attenuation_level
        case volume
        case boil_volume
        case method
        case ingredients
        case food_pairing
        case brewers_tips
        case contributed_by
      }
}

struct Ingredient: Decodable {
    let malt: [IngredientDetail]?
    let hops: [IngredientDetail]?
    let yeast: String?
    
    enum CodingKeys: String, CodingKey {
        case malt
        case hops
        case yeast
    }
}

struct IngredientDetail: Decodable {
    let name: String?
    let amount: UnitValue?
    let add: String?
    let attribute: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case add
        case attribute
    }
}

struct Method: Decodable{
    let mash_temp: [Temperature]?
    let fermentation: Temperature?
    let twist: String?
    
    enum CodingKeys: String, CodingKey {
        case mash_temp
        case fermentation
        case twist
    }
}

struct Temperature: Decodable{
    let temp: UnitValue?
    let duration: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case duration
    }
}

struct UnitValue: Decodable{
    let value: Double?
    let unit: String?
    
    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}
