//
//  ProductsCatalogApp.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import SwiftUI

@main
struct ProductsCatalogApp: App {
    
    private let appComponent = AppComponent()
    
    var body: some Scene {
        WindowGroup {
            appComponent.providesProductsView
        }
    }
}
