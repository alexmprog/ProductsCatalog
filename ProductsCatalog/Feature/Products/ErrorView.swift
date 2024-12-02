//
//  ErrorView.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 1.12.24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    
    let retry: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.gray)
                .padding(5)
            Text("error_title")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding(5)
            Text("error_description")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(5)
            Button("retry_action") {
                retry()
            }
            .bold()
        }
        .padding(50)
        .animation(.easeInOut, value: 0.5)
        .preferredColorScheme(.light)
    }
}
