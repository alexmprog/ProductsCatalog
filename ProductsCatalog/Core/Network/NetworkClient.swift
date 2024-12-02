//
//  NetworkClient.swift
//  ProductsCatalog
//
//  Created by Alexandr Golovach on 30.11.24.
//

import Foundation

class NetworkClient {
    
    private let baseURL: URL
        
    init(baseUrl: String) {
        self.baseURL = URL(string: baseUrl)!
    }
    
    func get<T:Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url, relativeTo: baseURL) else {
            throw NetworkClientError.badURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

enum NetworkClientError: Error {
    case unexpected
    case badURL
    case apiError(statusCode: Int)
}
