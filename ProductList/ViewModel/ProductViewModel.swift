//
//  ProductViewModel.swift
//  ProductList
//
//  Created by Vikas singh on 16/07/26.
//

import Foundation
import Combine

@MainActor
final class ProductViewModel: ObservableObject,Sendable {
    @Published var product: [Product] = []
    @Published var isLoading: Bool = false
    @Published var message = ""
    @Published var searchText: String = ""
    
    var services: ProductServiceProtocol
    init(services: ProductServiceProtocol) {
        self.services = services
    }

    var filteredProduct: [Product] {
        if searchText.isEmpty {
            return product
        }
        return product.filter{
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func fetchProduct() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do{
            product = try await services.fetchProducts()
            message = "Success"
        }catch {
            message = error.localizedDescription
        }
    }
    
}

