//
//  CharacterListViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 11/02/2024.
//
 
import Foundation

struct CharacterListViewData: Identifiable {
    var id: UUID = .init()
    let name: String
    let imageName: String
    
    init(from model: CharacterModel) {
        self.name = model.name
        self.imageName = model.name
    }
}
