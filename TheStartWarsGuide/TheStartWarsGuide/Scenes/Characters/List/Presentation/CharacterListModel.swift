//
//  CharacterListModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri on 07/05/2025.
//

import Foundation

struct CharacterListModel: Identifiable {
    let uid: Int
    let id: UUID
    let name: String
    
    init(from dto: CharacterOfListDTO) {
        self.uid = Int(dto.uid) ?? -1
        self.id = .init()
        self.name = dto.name
    }
}

