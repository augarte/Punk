//
//  PunkAPI.swift
//  Punk
//
//  Created by Aimar Ugarte on 7/3/22.
//

import Foundation

public protocol PunkAPIServiceProtocol {
    typealias CompletionHandler = ([Beer]) -> Void
    
    func fetchBeers(completion: @escaping CompletionHandler) -> Void
}

class PunkAPIService: PunkAPIServiceProtocol {
    
    private var network: NetworkService?
    private static var punkAPIService: PunkAPIService = {
        let punkAPIService = PunkAPIService()
        return punkAPIService
    }()
    
    private init() {
        self.network = NetworkService()
    }
    
    class func shared() -> PunkAPIService {
        return punkAPIService
    }
    
    public func fetchBeers(completion: @escaping CompletionHandler) {
        guard let net = network else { return }
        
        let endpoint = PunkAPIEndpoints.fetchBeers()
        net.request(endpoint: endpoint) { result in
            switch result {
                case .success(let responseData):
                    completion(responseData as! [Beer])
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    public func fetchBeersWithFilters(parameters: [String: Any], completion: @escaping CompletionHandler) {
        guard let net = network else { return }
        
        let endpoint = PunkAPIEndpoints.fetchBeers(parameters: parameters)
        net.request(endpoint: endpoint) { result in
            switch result {
                case .success(let responseData):
                    completion(responseData as! [Beer])
                case .failure(let error):
                    print(error)
            }
        }
    }
}
