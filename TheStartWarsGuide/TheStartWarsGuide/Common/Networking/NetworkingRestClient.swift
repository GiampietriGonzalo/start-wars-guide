//
//  NetworkingRestClient.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Foundation

final class NetworkingRestClient: NetworkingClientProtocol {
    
    private let sessionConfiguration: URLSessionConfiguration
    
    init(sessionConfiguration: URLSessionConfiguration = .default) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        var dto: T
        
        do {
            let session = URLSession(configuration: sessionConfiguration)
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw CustomError.serviceError
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            dto = try decoder.decode(T.self, from: data)
        } catch _ as DecodingError {
            throw CustomError.decodeError
        } catch {
            throw CustomError.networkError
        }
        
        return dto
    }
}
