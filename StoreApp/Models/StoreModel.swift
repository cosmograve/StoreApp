//
//  StoreModel.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    @Published private(set) var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    let client = HTTPClient()
    
    func fetchCategories() async throws {
        categories = try await client.load(Resource(url: URL.categories))
    }
    
    func fetchProductsByCategory(_ categoryID: Int) async throws {
        products = try await  client.load(Resource(url: URL.productsByCategory(categoryID)))
    }
}
