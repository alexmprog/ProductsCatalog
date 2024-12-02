//
//  ProductDTO.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

struct ProductPageListDTO: Decodable {
    let products: [ProductDTO]
}

struct ProductDTO: Decodable {
    let productId: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}
