//
//  CharacterListRepository.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

import Foundation

struct CharacterListRepository: CharacterListRepositoryProtocol {
    private let url: String
    private let sessionConfiguration: URLSessionConfiguration
    
    init(url: String = "https://swapi.dev/api/people/?page=", sessionConfiguration: URLSessionConfiguration = .default) {
        self.url = url
        self.sessionConfiguration = sessionConfiguration
    }
    
    func fetch(pageNumber: Int = 1) async throws -> CharacterListDTO {
        guard let url = URL(string: url + String(pageNumber)) else { throw CustomError.invalidUrl }
        var dto: CharacterListDTO

        do {
            let session = URLSession(configuration: sessionConfiguration)
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw CustomError.serviceError
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            dto = try decoder.decode(CharacterListDTO.self, from: data)
        } catch _ as DecodingError {
            throw CustomError.decodeError
        } catch {
            throw CustomError.networkError
        }
        
        return dto
    }
}
