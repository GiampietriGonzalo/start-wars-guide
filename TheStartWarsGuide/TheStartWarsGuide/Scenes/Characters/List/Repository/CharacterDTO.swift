//
//  CharacterDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

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
    let vehicles: [String]
    let starships: [String]
}

extension CharacterDTO {
    static let mock = CharacterDTO(name: "Luke Skywalker",
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
                                   vehicles: ["https://swapi.dev/api/vehicles/14/",
                                              "https://swapi.dev/api/vehicles/30/"],
                                   starships: ["https://swapi.dev/api/starships/12/",
                                               "https://swapi.dev/api/starships/22/"])
}
