//
//  GetProductsUseCase.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

protocol GetProductsUseCase {
    func invoke() async -> Result<[Product], NetworkClientError>
}

final class DefaultGetProductsUseCase: GetProductsUseCase {
    
    private let repository: ProductsRepository
    
    init(repository: ProductsRepository) {
        self.repository = repository
    }
    
    func invoke() async -> Result<[Product], NetworkClientError> {
        return await repository.getProducts()
    }
}
