//
//  CharacterDetailRepository.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Foundation

struct CharacterDetailRepository: CharacterDetailRepositoryProtocol {
   
    private let networkingClient: NetworkingClientProtocol
    
    init(networkingClient: NetworkingClientProtocol) {
        self.networkingClient = networkingClient
    }
   
    func fetchPlanetInformation(from url: String) async throws -> PlanetModel {
        guard let url = URL(string: url) else {
            throw CustomError.invalidUrl
        }
        
        return try await networkingClient.fetch(from: url)
    }
}
