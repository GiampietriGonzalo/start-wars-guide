//
//  NetworkingRestClient.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

/**
 *  Handle Rest networking calls
 * - Parameter url: The endpoint to perform the service call
 * - Returns: A Decodable instance
 * - Throws: **CustomError.serviceError:** when the service response status is not OK.  **CustomError.decodeError:**  when It is not possible to decode the response. **CustomError.networkError:** When there is another error with the service call
 */
final class NetworkingRestClient: NetworkingClientProtocol {
    static let shared = NetworkingRestClient()
    private var session = URLSession(configuration: .default)
    
    private init() {}
    
    func configure(with configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        var dto: T
        do {
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
