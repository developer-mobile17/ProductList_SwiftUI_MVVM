//
//  ContentView.swift
//  ProductList
//
//  Created by Vikas singh on 16/07/26.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var vm = ProductViewModel(services: APIServices())
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    ProgressView()
                }else {
                    List(vm.filteredProduct) { product  in
                        ProductCellRow(product: product)
                    }
                    .searchable(text: $vm.searchText,
                                prompt: "Search Products"
                    )

                }
                
            }
            .task {
                await vm.fetchProduct()
            }
            .navigationTitle("Products")
           
            
        }
    }
}

#Preview {
    ProductView()
}
