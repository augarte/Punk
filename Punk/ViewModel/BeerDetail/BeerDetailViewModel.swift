//
//  BeerDetailViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 13/3/22.
//

import Foundation

struct BeerDetailViewModel {
    let title: String
    let tagline: String
    let description: String
    let abv: String
    let image: String
    let malt: String
    let hops: String
    let yeast: String
}

extension BeerDetailViewModel {

    init(beer: Beer) {
        self.title = beer.name?.uppercased() ?? ""
        self.image = beer.image_url ?? ""
        self.tagline = beer.tagline?.uppercased() ?? ""
        self.description = beer.description ?? ""
        
        if let abv = beer.abv {
            self.abv = abv.clean + "%"
        } else {
            self.abv = ""
        }
        
        self.yeast = beer.ingredients?.yeast ?? ""
        self.malt = beer.ingredients?.malt?.map{$0.name ?? ""}.joined(separator: ", ") ?? ""
        self.hops = beer.ingredients?.hops?.map{$0.name ?? ""}.joined(separator: ", ") ?? ""
    }
}
