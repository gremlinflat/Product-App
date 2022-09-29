//
//  ProductListViewModel.swift
//  Product App
//
//  Created by Fahri Novaldi on 29/09/22.
//

import Foundation

class ProductListViewModel {
    let title = "Product List"
    
    var products: [Product] = []
    var page: Int = 1
    
    func getProductsCount() -> Int {
        return products.count
    }
    
    func getProduct(at index: Int) -> Product {
        return products[index]
    }
    
    func fetchProducts(completion: @escaping () -> Void) {
        NetworkManager.shared.getProducts(page: page) { [weak self] result in
            switch result {
            case .success(let fetchedProducts):
                self?.products = fetchedProducts
                completion()
            case .failure(_):
                fatalError()
            }
        }
    }
    
    func fetchNextPage(completion: @escaping () -> Void){
        page += 1
        fetchProducts(completion: completion)
    }
}
