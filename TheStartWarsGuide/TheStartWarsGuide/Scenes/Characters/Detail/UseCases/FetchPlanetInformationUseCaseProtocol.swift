//
//  FetchPlanetInformationUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchPlanetInformationUseCaseProtocol {
    func execute() async throws -> PlanetModel
}