//
//  CharacterDetailRepository.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

final class CharacterDetailRepository: CharacterDetailRepositoryProtocol {
    private let networkingClient: NetworkingClientProtocol
    
    init(networkingClient: NetworkingClientProtocol) {
        self.networkingClient = networkingClient
    }
    
    func fetchCharacterDetail(with url: String) async throws -> CharacterDetailDTO {
        guard let url = URL(string: url) else {
            throw CustomError.invalidUrl(url)
        }
        
        return try await networkingClient.fetch(from: url)
    }
   
    func fetchPlanetInformation(from url: String) async throws -> PlanetDTO {
        guard let url = URL(string: url) else {
            throw CustomError.invalidUrl(url)
        }
        
        return try await networkingClient.fetch(from: url)
    }
    
    func fetchVehicle(from url: String) async throws -> VehicleModel {
        guard let url = URL(string: url) else {
            throw CustomError.invalidUrl(url)
        }
        
        return try await networkingClient.fetch(from: url)
    }
    
    func fetchFilm(from url: String) async throws -> FilmModel {
        guard let url = URL(string: url) else {
            throw CustomError.invalidUrl(url)
        }
        
        return try await networkingClient.fetch(from: url)
    }
}
