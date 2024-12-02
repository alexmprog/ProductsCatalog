//
//  ProductsListView.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation
import SwiftUI

struct ProductsView: View {
    
    @ObservedObject private var viewModel: ProductsViewModel
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products, id: \.id) { item in
                    NavigationLink {
                        ProductDetailsView(item: item)
                    } label: {
                        ProductItemView(item: item)
                    }
                }
            }
            .overlay {
                if viewModel.isError {
                    ErrorView() {
                        Task {
                            await viewModel.fetchProducts()
                        }
                    }
                }
            }
            .preferredColorScheme(.light)
            .navigationTitle("products_title")
            .task {
                await viewModel.fetchProducts()
            }
        }
    }
}
