//
//  CharacterListDTO.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

struct CharacterListDTO: Decodable {
    let totalRecords: Int
    let totalPages: Int
    let results: [CharacterOfListDTO]
}

struct CharacterOfListDTO: Decodable {
    let uid: String
    let name: String
}
