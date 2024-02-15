//
//  PlanetViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct PlanetViewData {
    let name: String
    let climate: String
    let terrain: String
    let gravity: String
    let population: String
    
    init(from model: PlanetModel) {
        self.name = model.name
        self.climate = model.climate
        self.terrain = model.terrain
        self.gravity = model.gravity
        self.population = model.population
    }
}

extension PlanetViewData {
    static let mock = PlanetViewData(from: .init(name: "Hearth",
                                                 climate: "Cloudy",
                                                 terrain: "Water",
                                                 gravity: "Standar 1",
                                                 population: "7888000000"))
}
