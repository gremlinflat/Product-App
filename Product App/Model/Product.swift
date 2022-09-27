//
//  Product.swift
//  Product App
//
//  Created by Fahri Novaldi on 27/09/22.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let category: String //TODO: Refactor to enum if necessary
    let description: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Float
    let count: Int
}
