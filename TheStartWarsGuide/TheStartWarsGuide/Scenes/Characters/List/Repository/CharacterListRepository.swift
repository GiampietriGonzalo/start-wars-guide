//
//  CharacterListRepository.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

struct CharacterListRepository: CharacterListRepositoryProtocol {
    private let url: String
    private let networkingClient: NetworkingClientProtocol
    
    init(url: String = "https://swapi.tech/api/people/?page=",
         networkingClient: NetworkingClientProtocol) {
        self.url = url
        self.networkingClient = networkingClient
    }
    
    func fetch(pageNumber: Int = 1, limit: Int = 10) async throws -> CharacterListDTO {
        let stringUrl = url + String(pageNumber) + "&limit=\(limit)"
        guard let url = URL(string: stringUrl) else {
            throw CustomError.invalidUrl(stringUrl)
        }
        
        return try await networkingClient.fetch(from: url)
    }
}
