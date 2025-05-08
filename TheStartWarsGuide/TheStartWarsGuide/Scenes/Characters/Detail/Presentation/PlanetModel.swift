//
//  PlanetModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

struct PlanetDTO: Decodable {
    let result: PlanetResultDTO
}

struct PlanetResultDTO: Decodable {
    let properties: PlanetModel
}

struct PlanetModel: Decodable {
    let name: String
    let climate: String
    let terrain: String
    let gravity: String
    let population: String
}
