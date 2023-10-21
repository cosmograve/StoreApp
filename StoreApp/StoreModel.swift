//
//  StoreModel.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    @Published var categories: [Category] = []
    let client = HTTPClient()
    
    func fetchCategories() async throws {
        categories = try await client.getCategories(url:  URL.categories)
        
    }
}
