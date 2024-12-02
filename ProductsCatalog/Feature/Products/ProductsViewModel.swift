//
//  ProductsViewModel.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    
    @Published var products: [ProductItem] = []
    @Published var isError: Bool = false
    
    private let getProductsUseCase: GetProductsUseCase
    private let mapper: ProductItemMapper
    
    init(useCase: GetProductsUseCase, mapper: ProductItemMapper) {
        self.getProductsUseCase = useCase
        self.mapper = mapper
    }
    
    @MainActor
    func fetchProducts() async {
        if(!self.products.isEmpty) {
            return
        }
        let result = await getProductsUseCase.invoke()
        do {
            let products = try result.get()
            self.isError = false
            self.products = products.map{ mapper.map(model: $0) }
        } catch {
            self.isError = true
        }
    }
}
