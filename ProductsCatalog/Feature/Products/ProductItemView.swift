//
//  ProductItemView.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import SwiftUI

struct ProductItemView: View {
    
    var item: ProductItem
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: item.image)) { phase in
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
                   .frame(width: 96, height: 96)
            VStack(alignment: .leading) {
                Text(item.title).font(.title2)
                Text(item.price)
                    .foregroundStyle(.red)
                    .font(.title3)
            }
        }
        .preferredColorScheme(.light)
    }
}
