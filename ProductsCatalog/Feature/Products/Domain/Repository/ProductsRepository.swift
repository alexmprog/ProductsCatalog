//
//  ProductsRepository.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

protocol ProductsRepository {
    func getProducts() async -> Result<[Product], NetworkClientError>
}
