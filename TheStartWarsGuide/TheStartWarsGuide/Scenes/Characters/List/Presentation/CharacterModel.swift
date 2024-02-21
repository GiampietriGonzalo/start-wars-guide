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
        self.vehicles = dto.vehicles
        self.starships = dto.starships
    }
}

extension CharacterModel {
    static let mock = CharacterModel(from: .mock)
}
