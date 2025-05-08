//
//  CharacterDetailDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

struct CharacterDetailDTO: Decodable {
    let result: CharacterDetailResultDTO
}

struct CharacterDetailResultDTO: Decodable {
    let properties: CharacterDTO
}

struct CharacterDTO: Decodable {
    let name: String
    let skinColor: String
    let hairColor: String
    let height: String
    let eyeColor: String
    let mass: String
    let gender: String
    let homeworld: String
    let birthYear: String
    let films: [String]?
    let vehicles: [String]?
    let starships: [String]?
}

/**
 "name": "Luke Skywalker",
       "gender": "male",
       "skin_color": "fair",
       "hair_color": "blond",
       "height": "172",
       "eye_color": "blue",
       "mass": "77",
       "homeworld": "https://www.swapi.tech/api/planets/1",
       "birth_year": "19BBY",
       "url": "https://www.swapi.tech/api/people/1"
 
 
 */

extension CharacterDTO {
    static let mock = CharacterDTO(name: "Luke Skywalker",
                                   skinColor: "172",
                                   hairColor: "77",
                                   height: "blond",
                                   eyeColor: "fair",
                                   mass: "fair",
                                   gender: "Male",
                                   homeworld: "19BBY",
                                   birthYear: "male",
                                   films: ["https://swapi.dev/api/films/1/",
                                           "https://swapi.dev/api/films/2/",
                                           "https://swapi.dev/api/films/3/",
                                           "https://swapi.dev/api/films/6/"],
                                   vehicles: ["https://swapi.dev/api/vehicles/14/",
                                              "https://swapi.dev/api/vehicles/30/"],
                                   starships: ["https://swapi.dev/api/starships/12/",
                                               "https://swapi.dev/api/starships/22/"])
}
