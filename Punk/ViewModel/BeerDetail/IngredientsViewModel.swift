//
//  IngredientsViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 14/3/22.
//

import Foundation

enum IngredientType: Int {
    case hops = 0
    case malt = 1
    case yeast = 2
}

struct IngredientsViewModel {
    let ingredientTitle: String
    let ingredientsText: String
}

extension IngredientsViewModel {

    init(beerInfo: (BeerDetailViewModel, IngredientType)) {
        switch beerInfo.1 {
        case .hops:
            self.ingredientTitle = NSLocalizedString("beer.ingredients.hops", comment: "")
            self.ingredientsText = beerInfo.0.hops
        case .malt:
            self.ingredientTitle = NSLocalizedString("beer.ingredients.malt", comment: "")
            self.ingredientsText = beerInfo.0.malt
        case .yeast:
            self.ingredientTitle = NSLocalizedString("beer.ingredients.yeast", comment: "")
            self.ingredientsText = beerInfo.0.yeast
        }
    }
}
