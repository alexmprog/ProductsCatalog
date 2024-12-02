//
//  ProductsService.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

protocol ProductsDataSource {
    func getProducts() async throws -> ProductPageListDTO
}

final class DefaultProductsDataSource: ProductsDataSource {
    
    private static let products = "/products"
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getProducts() async throws -> ProductPageListDTO {
        return try await networkClient.get(url: DefaultProductsDataSource.products)
    }
}
