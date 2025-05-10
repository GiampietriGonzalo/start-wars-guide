//
//  CharacterDetailRepositoryMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

@testable import TheStartWarsGuide

final class CharacterDetailRepositoryMock: CharacterDetailRepositoryProtocol {
    

    var characterDetailDTO: CharacterDetailDTO?
    var planetDTO: PlanetDTO?
    var vehicleModel: VehicleModel?
    var filmModel: FilmModel?
    var error: CustomError = .unknown
    
    func fetchCharacterDetail(with url: String) async throws -> CharacterDetailDTO {
        guard let characterDetailDTO else { throw error }
        return characterDetailDTO
    }
    
    func fetchPlanetInformation(from url: String) async throws -> PlanetDTO {
        guard let planetDTO else { throw error }
        return planetDTO
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
