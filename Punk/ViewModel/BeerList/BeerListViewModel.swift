//
//  BeerViewModel.swift
//  Punk
//
//  Created by Aimar Ugarte on 6/3/22.
//

import Foundation

protocol ViewModelDelegate {
    func refreshTable()
}

class BeerListViewModel {
    
    var network: NetworkService?
    var delegate: ViewModelDelegate?

    var filtersActive = false
    
    var data: [Beer] = []
    var list: [BeerListItemViewModel] = []
    lazy var filteredList: [BeerListItemViewModel] = []
    
    init() {
        network = NetworkService()
    }
}

extension BeerListViewModel{
    
    func didSearch(query: String) {
        guard !query.isEmpty else { return }
        
        let searchParameter = query.replacingOccurrences(of: " ", with: "_")
        let query = ["food": searchParameter];
        fetchBeersByQuery(query: query)
    }
    
    func filter(filterType: FilterType, value: Float) {
        filtersActive = true
        let auxList = data.filter {
            switch filterType {
            case .abv:
                return ($0.abv ?? 0.0) <= 4.1//Double(value)
            case .ibu:
                return ($0.ibu ?? 0.0) <= Double(value)
            }
        }
        filteredList = auxList.map(BeerListItemViewModel.init)
        self.delegate?.refreshTable()
    }
}

extension BeerListViewModel {
    
    func fetchAllBeers() {
        PunkAPIService.shared().fetchBeers() { data in
            self.data = data
            self.list = data.map(BeerListItemViewModel.init)
            self.delegate?.refreshTable()
        }
    }
    
    func fetchBeersByQuery(query: [String: Any]) {
        PunkAPIService.shared().fetchBeersWithFilters(parameters: query) { data in
            self.data = data
            self.filteredList = data.map(BeerListItemViewModel.init)
            self.delegate?.refreshTable()
        }
    }
}
