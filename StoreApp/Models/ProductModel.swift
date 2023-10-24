//
//  ProductModel.swift
//  StoreApp
//
//  Created by Алексей Авер on 22.10.2023.
//

import Foundation

struct Product: Codable  {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}

extension Product {
    static var preview: Product {
        Product(id: 4, title: "Handmade Fresh Table", price: 687, description: "Andy shoes are designed to keeping in...", images: [URL(string: "https://placeimg.com/640/480/any?r=0.9178516507833767")!], category: Category.preview)
    }
}
