//
//  URL+Extension.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import Foundation

extension URL {
    static var development: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var production: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var `default`: URL {
        #if DEBUG
        return development
        #else
        return production
        #endif
    }
    
    static var categories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.default)!
    }
    
    static func productsByCategory(_ categooryID: Int) -> URL {
        return URL(string: "/api/v1/categories/\(categooryID)/products&limit=20", relativeTo: Self.default)!
    }
}
