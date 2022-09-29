//
//  NetworkManager.swift
//  Product App
//
//  Created by Fahri Novaldi on 29/09/22.
//
//
//  NetworkManager.swift
//  gh follower
//
//  Created by Fahri Novaldi on 18/08/22.
//

import UIKit

class NetworkManager {
    private init() {}
    
    static let shared = NetworkManager()
    private let baseURL =  "https://fakestoreapi.com"
    let productsPerPage = 20
    
    func getProducts(page: Int, completion: @escaping (Result<[Product], NetworkError>) -> Void ) {
        let endpoint = baseURL + "/products?limit=\(productsPerPage * page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.missingUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.failed))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badRequest))
                return
            }
            
            guard let data = data else {
                completion(.failure(.decodingFailed))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let products = try decoder.decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        task.resume()
    }
    

}


enum NetworkError: String, Error {
    case missingUrl = "URL is missing"
    case decodingFailed = "Decoding failed"
    case badRequest = "Bad request"
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}
