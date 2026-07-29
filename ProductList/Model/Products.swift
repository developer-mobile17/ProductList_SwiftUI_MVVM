//
//  Products.swift
//  ProductList
//
//  Created by Vikas singh on 16/07/26.
//

struct ProductResponse: Codable{
        let products: [Product]
}

struct Product: Codable,Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let thumbnail: String
}
