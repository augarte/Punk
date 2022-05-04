//
//  FilterViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 28/3/22.
//

import Foundation

struct FilterListItemViewModel {
    let filterType: FilterType
    let title: String
    let min: Float?
    let max: Float?
    let startingValue: Float?
}

extension FilterListItemViewModel {
    
    init(filter: Filter) {
        filterType = filter.filterType
        title = filter.name
        min = filter.min
        max = filter.max
        startingValue = filter.startingValue
    }
}
