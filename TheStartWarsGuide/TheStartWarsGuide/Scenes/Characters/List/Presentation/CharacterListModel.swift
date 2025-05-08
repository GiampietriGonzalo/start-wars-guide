//
//  CharacterListModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri on 07/05/2025.
//

import Foundation

struct CharacterListModel: Identifiable {
    let uid: String
    let id: UUID
    let name: String
    let url: String
    
    init(from dto: CharacterOfListDTO) {
        self.uid = dto.uid
        self.id = .init()
        self.name = dto.name
        self.url = dto.url
    }
}

