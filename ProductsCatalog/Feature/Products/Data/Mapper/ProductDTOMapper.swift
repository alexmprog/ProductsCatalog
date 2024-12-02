//
//  ProductDTOMapper.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

struct ProductDTOMapper {
    
    func map(model: ProductDTO) -> Product {
        .init(productId: model.productId,
              title: model.title ?? "",
              description: model.description ?? "",
              price: model.price ?? 0,
              category: model.category ?? "",
              thumbnail: model.thumbnail ?? "")
    }

}
