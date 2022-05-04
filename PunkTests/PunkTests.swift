//
//  PunkTests.swift
//  PunkTests
//
//  Created by Aimar Ugarte on 5/3/22.
//

import XCTest
@testable import PunkDebug

class PunkTests: XCTestCase {

    var mockBeerVM: BeerListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockBeerVM = BeerListViewModel()
    }

    override func tearDownWithError() throws {
        mockBeerVM = nil
    }

    func testFetchAllBeers() throws {
        PunkAPIService.shared().fetchBeers() { data in
            let beers = data.map(BeerListItemViewModel.init)
            XCTAssert(beers.count == 25, "ERROR")
        }
    }
    
    func testFetchBeersWithFilter() throws {
        let foodName = "beer"
        let searchParameter = foodName.replacingOccurrences(of: " ", with: "_")
        let query = ["food": searchParameter];
        PunkAPIService.shared().fetchBeersWithFilters(parameters: query) { data in
            let beers = data.map(BeerListItemViewModel.init)
            XCTAssert(beers.count == 4, "ERROR")
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            PunkAPIService.shared().fetchBeers() { data in
                _ = data.map(BeerListItemViewModel.init)
            }
        }
    }

}
