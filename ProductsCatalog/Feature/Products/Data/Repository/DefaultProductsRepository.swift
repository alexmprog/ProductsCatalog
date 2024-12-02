//
//  DefaultProductsRepository.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

final class DefaultProductsRepository: ProductsRepository {
    
    private let dataSource: ProductsDataSource
    private let mapper: ProductDTOMapper
    
    init(dataSource: ProductsDataSource, mapper: ProductDTOMapper) {
        self.dataSource = dataSource
        self.mapper = mapper
    }
    
    func getProducts() async -> Result<[Product], NetworkClientError> {
        do {
            let success = try await dataSource.getProducts().products.map { mapper.map(model: $0)}
            return Result.success(success)
        } catch {
            let failure = error as? NetworkClientError ?? NetworkClientError.unexpected
            return Result.failure(failure)
        }
    }
}
