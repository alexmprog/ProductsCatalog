//
//  ProductItemMapper.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

struct ProductItemMapper {
    
    func map(model: Product) -> ProductItem {
        .init(id: model.productId,
              title: model.title,
              description: model.description,
              price: getAmountWithCurrency(value: model.price),
              category: model.category.capitalized,
              image: model.thumbnail)
    }
    
    private func getAmountWithCurrency(value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }

}
