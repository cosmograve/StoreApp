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

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
            case .get: "GET"
            case .post: "POST"
            case .delete: "DELETE"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var headers: [String: String] = [:]
    var method: HTTPMethod = .get([])
}

class HTTPClient {
    
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.allHTTPHeaderFields = resource.headers
        request.httpMethod = resource.method.name
        
        switch resource.method {
        case .get(let queryItems ):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            guard let url = components?.url else { throw NetworkError.badURl }
            request.url = url
        case .post(_):
            break
        case .delete:
            break
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 || response.statusCode == 201  else {
            throw NetworkError.invalidResponse
        }
        guard let object = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return object
        
    }
}
