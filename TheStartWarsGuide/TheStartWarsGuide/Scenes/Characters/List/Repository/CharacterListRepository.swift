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
    
    init(url: String = "https://swapi.dev/api/people/?page=",
         networkingClient: NetworkingClientProtocol) {
        self.url = url
        self.networkingClient = networkingClient
    }
    
    func fetch(pageNumber: Int = 1) async throws -> CharacterListDTO {
        guard let url = URL(string: url + String(pageNumber)) else {
            throw CustomError.invalidUrl
        }
        
        return try await networkingClient.fetch(from: url)
    }
}
