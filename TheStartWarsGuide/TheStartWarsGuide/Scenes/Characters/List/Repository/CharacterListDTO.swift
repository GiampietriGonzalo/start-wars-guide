//
//  CharacterListDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

struct CharacterListDTO: Decodable {
    let count: Int
    let results: [CharacterDTO]
}
