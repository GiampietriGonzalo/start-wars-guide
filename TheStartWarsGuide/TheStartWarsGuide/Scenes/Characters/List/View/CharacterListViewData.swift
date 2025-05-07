//
//  CharacterListViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//
 
import Foundation

struct CharacterListViewData: Identifiable {
    var id: UUID = .init()
    let name: String
    let imageName: String
    
    init(from model: CharacterListModel) {
        self.name = model.name
        self.imageName = model.name
    }
}
