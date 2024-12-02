//
//  ProductItem.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

struct ProductItem: Hashable {
    var id: Int
    var title: String
    var description: String
    var price: String
    var category: String
    var image: String
}
