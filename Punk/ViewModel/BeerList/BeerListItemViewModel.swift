//
//  BeerViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 13/3/22.
//

import Foundation

struct BeerListItemViewModel {
    let id: Int
    let title: String
    let description: String
    let info: String
    let image: String
}

extension BeerListItemViewModel {

    init(beer: Beer) {
        self.id = beer.id
        self.title = beer.name?.uppercased() ?? ""
        self.description = beer.tagline?.uppercased() ?? ""
        self.image = beer.image_url ?? ""
        
        var abvText = ""
        if let abv = beer.abv {
            abvText = abv.clean + "%"
        }
        
        var volume = ""
        if let value = beer.volume?.value, let unit = beer.volume?.unit {
            volume = value.clean + " " + unit
        }
        
        self.info = (abvText + (!abvText.isEmpty && !volume.isEmpty ? " · " + volume : volume)).uppercased()
    }
}
