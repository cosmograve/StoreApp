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

extension Category {
    static var preview: Category {
        Category(id: 3, name: "Change title", image: URL(string: "https://api.lorem.space/image/furniture?w=640&h=480&r=7358")!)
    }
}
