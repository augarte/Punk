//
//  BeerPage.swift
//  Punk
//
//  Created by Aimar Ugarte on 6/3/22.
//

import Foundation

struct BeerPage: Decodable {
    let page: Int
    let totalPage: Int
    let results: [Beer]

    enum CodingKeys: String, CodingKey {
        case page
        case totalPage
        case results
    }

    init(results:[Beer]){
        self.page = 0
        self.totalPage = 0
        self.results = results
    }
}
