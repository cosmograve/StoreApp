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
