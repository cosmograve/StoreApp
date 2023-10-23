//
//  CategoryModel.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import Foundation

struct Category: Codable, Hashable {
    var id: Int
    var name: String
    var image: URL
}
