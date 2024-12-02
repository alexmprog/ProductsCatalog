//
//  ProductDetailsView.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation
import SwiftUI

struct ProductDetailsView: View {
    
    let item: ProductItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.image),
                           transaction: Transaction(animation: .snappy)) { phase in
                        switch phase {
                           case .failure:
                               Image(systemName: "photo")
                                   .font(.largeTitle)
                           case .success(let image):
                               image.resizable()
                           default:
                               ProgressView()
                           }
                }
                .scaledToFit()
                Text(item.title)
                    .font(.title)
                Text(item.price)
                    .font(.title2)
                Text(item.description)
                    .font(.title3)
            }
            .padding(10)
            .navigationTitle(item.category)
            .navigationBarTitleDisplayMode(.inline)
        }.preferredColorScheme(.light)
    }
}
