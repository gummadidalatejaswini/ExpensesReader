//
//  APIClient.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidJSON
}

enum APIClient {

    static func fetch<T>(
        from url: URL,
        transform: ([[String: Any]]) throws -> T
    ) async throws -> T {

        let (data, response) = try await URLSession.shared.data(
            from: url
        )

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        do {
          let  json = try JSONSerialization.jsonObject(with: data)
            guard let dictionaries = json as? [[String: Any]] else {
                throw NetworkError.invalidJSON
            }
            return try transform(dictionaries)
        } catch {
            throw NetworkError.invalidJSON
        }
        
    }
}
