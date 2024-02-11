//
//  CharacterListDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

struct CharacterListDTO: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [CharacterDTO]
}

struct CharacterDTO: Decodable {
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
}
