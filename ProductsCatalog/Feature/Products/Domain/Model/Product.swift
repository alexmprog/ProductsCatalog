//
//  Product.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

struct Product: Identifiable {
    let productId: Int
    let title: String
    let description: String
    let price: Double
    var category: String
    let thumbnail: String
    
    var id: Int { productId }
}
