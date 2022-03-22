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

    func testExample() throws {
        mockBeerVM.fetchAllBeers()
       
        XCTAssert(mockBeerVM.data.count > 0, "ERROR")


        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
