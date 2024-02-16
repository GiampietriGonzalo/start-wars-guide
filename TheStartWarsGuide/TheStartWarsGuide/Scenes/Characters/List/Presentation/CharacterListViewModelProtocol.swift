//
//  CharacterListViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

protocol CharacterListViewModelProtocol {
    var isLoading: Bool { get }
    var characters: [CharacterListViewData] { get }
    
    func loadContent() async
    func getModel(of characterName: String) -> CharacterModel
}
