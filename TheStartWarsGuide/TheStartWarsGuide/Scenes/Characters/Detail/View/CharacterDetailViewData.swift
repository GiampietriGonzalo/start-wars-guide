//
//  CharacterDetailViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct CharacterDetailViewData {
    let planet: PlanetViewData
    let vehicles: [VehicleViewData]
    let starships: [VehicleViewData]
    let films: [FilmViewData]
}

extension CharacterDetailViewData {
    static let empty = CharacterDetailViewData(planet: .mock, vehicles: [], starships: [], films: [])
}
