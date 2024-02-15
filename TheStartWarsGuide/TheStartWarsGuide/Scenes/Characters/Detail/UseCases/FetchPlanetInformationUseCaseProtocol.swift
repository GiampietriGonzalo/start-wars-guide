//
//  FetchPlanetInformationUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchPlanetInformationUseCaseProtocol {
    func execute(with url: String) async throws -> PlanetModel
}
