//
//  CharacterDetailRepositoryMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

@testable import TheStartWarsGuide

final class CharacterDetailRepositoryMock: CharacterDetailRepositoryProtocol {
    
    var planetModel: PlanetModel?
    var vehicleModel: VehicleModel?
    var filmModel: FilmModel?
    var error: CustomError = .unknown
    
    func fetchPlanetInformation(from url: String) async throws -> PlanetModel {
        guard let planetModel else { throw error }
        return planetModel
    }
    
    func fetchVehicle(from url: String) async throws -> VehicleModel {
        guard let vehicleModel else { throw error }
        return vehicleModel
    }
    
    func fetchFilm(from url: String) async throws -> FilmModel {
        guard let filmModel else { throw error }
        return filmModel
    }
}
