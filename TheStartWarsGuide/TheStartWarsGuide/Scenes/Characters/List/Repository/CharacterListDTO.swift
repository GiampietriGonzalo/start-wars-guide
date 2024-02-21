//
//  CharacterListDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

struct CharacterListDTO: Decodable {
    let count: Int
    let results: [CharacterDTO]
}
