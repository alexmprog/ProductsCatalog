//
//  AppDIComponent.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation

final class AppComponent {
    
    lazy private var networkClient: NetworkClient = {
        return NetworkClient(baseUrl: "https://dummyjson.com")
    }()

    lazy var providesProductsView: ProductsView = {
        let productsModule = ProductsModule(networkClient: networkClient)
        return productsModule.providesProductsView()
    }()
}
