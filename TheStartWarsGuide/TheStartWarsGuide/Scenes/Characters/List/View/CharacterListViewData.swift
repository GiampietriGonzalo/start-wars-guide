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
    let url: String
    
    init(from model: CharacterListModel) {
        self.name = model.name
        self.imageName = model.name
        self.url = model.url
    }
}
