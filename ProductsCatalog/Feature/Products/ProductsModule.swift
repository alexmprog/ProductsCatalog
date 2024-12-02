//
//  ProductsModule.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

final class ProductsModule {

    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func providesProductsView() -> ProductsView {
        ProductsView(viewModel: providesProductsViewModel())
    }
    
    private func providesProductsViewModel() -> ProductsViewModel {
        ProductsViewModel(useCase: providesGetProductsUseCase(), mapper: providesProductItemMapper())
    }
    
    private func providesGetProductsUseCase() -> GetProductsUseCase {
        DefaultGetProductsUseCase(repository: providesProductsRepository())
    }
    
    private func providesProductItemMapper() -> ProductItemMapper {
        ProductItemMapper()
    }
    
    private func providesProductsRepository() -> ProductsRepository {
        DefaultProductsRepository(dataSource: providesProductsDataSource(), mapper: providesProductDTOMapper())
    }
    
    private func providesProductsDataSource() -> ProductsDataSource {
        DefaultProductsDataSource(networkClient: networkClient)
    }
    
    private func providesProductDTOMapper() -> ProductDTOMapper {
        ProductDTOMapper()
    }
}
