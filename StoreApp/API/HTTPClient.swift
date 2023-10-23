//
//  HTTPClient.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case badURl
    case decodingError
    case invalidServerResponse
    case invalidURL
}

class HTTPClient {
    func getCategories(url: URL) async throws -> [Category] {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.decodingError
        }
        return categories
    }
    
    func getProductsByCategory(url: URL) async throws -> [Product] {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingError
        }
        return products
    }
}
