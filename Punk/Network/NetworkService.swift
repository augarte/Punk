//
//  NetworkService.swift
//  Punk
//
//  Created by Aimar Ugarte on 5/3/22.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case jsonParsing
    case notConnected
}

public protocol NetworkServiceProtocol {
    typealias CompletionHandler = (Result<Decodable, AFError>) -> Void
    
    func request<T: Decodable>(endpoint: Endpoint<T>, completion: @escaping CompletionHandler) -> Void
}

class NetworkService: NetworkServiceProtocol {
    
    lazy var appConfiguration = AppConfiguration()
    
    var dataRequestArray: [DataRequest] = []

    public func request<T: Decodable>(endpoint: Endpoint<T>, completion: @escaping CompletionHandler) {
        
        let url = appConfiguration.apiBaseURL + endpoint.path

        AF.request(url, method: Alamofire.HTTPMethod.get, parameters: endpoint.parameters, headers: endpoint.header)
            .responseDecodable(of: T.self) { response in
            switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func validateResponse() {
        
    }
    
}
