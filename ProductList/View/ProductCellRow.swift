//
//  ProductCellRow.swift
//  ProductList
//
//  Created by Vikas singh on 16/07/26.
//

import SwiftUI
struct ProductCellRow: View {
    let product: Product
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80,height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(5)
                
                Text("$\(product.price , specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            Spacer()

        }
        .padding(.vertical, 8)
    }
}
