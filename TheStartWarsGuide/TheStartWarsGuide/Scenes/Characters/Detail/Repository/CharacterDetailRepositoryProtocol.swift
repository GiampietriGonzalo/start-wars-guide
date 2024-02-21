//
//  CharacterDetailRepositoryProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol CharacterDetailRepositoryProtocol {
    func fetchPlanetInformation(from url: String) async throws -> PlanetModel
    func fetchVehicle(from url: String) async throws -> VehicleModel
    func fetchFilm(from url: String) async throws -> FilmModel
}
