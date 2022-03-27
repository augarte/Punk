//
//  FilterListViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 28/3/22.
//

import Foundation

public enum FilterType: Int, CaseIterable, Decodable{
    case abv = 0
    case ibu = 1
}

class FilterListViewModel {
    
    var list: [FilterListItemViewModel] = []
    
    init() {
        list = getAllFilters().map(FilterListItemViewModel.init)
    }
}

extension FilterListViewModel {
    
    func getAllFilters() -> [Filter]{
        
        var filters: [Filter] = []
        filters.append(Filter.init(filterType: FilterType.abv, name: NSLocalizedString("beer.abv", comment: ""), min: 0, max: 55, startingValue: 55))
        filters.append(Filter.init(filterType: FilterType.ibu, name: NSLocalizedString("beer.ibu", comment: ""), min: 0, max: 300, startingValue: 300))
        
        return filters
    }
}
