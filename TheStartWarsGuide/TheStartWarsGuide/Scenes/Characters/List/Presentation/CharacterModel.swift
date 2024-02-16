//
//  CharacterModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

import Foundation

struct CharacterModel: Identifiable {
    var id: UUID
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    
    init(from dto: CharacterDTO) {
        self.id = .init()
        self.name = dto.name
        self.height = dto.height
        self.mass = dto.mass
        self.hairColor = dto.hairColor
        self.skinColor = dto.skinColor
        self.eyeColor = dto.eyeColor
        self.birthYear = dto.birthYear
        self.gender = dto.gender
        self.homeworld = dto.homeworld
        self.films = dto.films
        self.species = dto.species
        self.vehicles = dto.vehicles
        self.starships = dto.starships
    }
}

extension CharacterModel {
    static let mock = CharacterModel(from: CharacterDTO(name: "Luke Skywalker",
                                                        height: "172",
                                                        mass: "77",
                                                        hairColor: "blond",
                                                        skinColor: "fair",
                                                        eyeColor: "blue",
                                                        birthYear: "19BBY",
                                                        gender: "male",
                                                        homeworld: "https://swapi.dev/api/planets/1/",
                                                        films: ["https://swapi.dev/api/films/1/",
                                                                "https://swapi.dev/api/films/2/",
                                                                "https://swapi.dev/api/films/3/",
                                                                "https://swapi.dev/api/films/6/"],
                                                        species: [],
                                                        vehicles: ["https://swapi.dev/api/vehicles/14/",
                                                                   "https://swapi.dev/api/vehicles/30/"],
                                                        starships: ["https://swapi.dev/api/starships/12/",
                                                                    "https://swapi.dev/api/starships/22/"]))
    
}
