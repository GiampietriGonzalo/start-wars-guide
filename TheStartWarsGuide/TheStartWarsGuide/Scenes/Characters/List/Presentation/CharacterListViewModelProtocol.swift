//
//  CharacterListViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

/**
 The view model associated to the CharacterList screen
 */
protocol CharacterListViewModelProtocol {
    var isLoading: Bool { get }
    var characters: [CharacterListViewData] { get }
    
    /**
     Performs an asynchronous call to fetch the character list
     */
    func loadContent() async
    
    /**
     Returns a CharacterModel using the character name as a filter
     - parameter characterName: The character name to look for the model
     - returns: The CharacterModel that matchs the character name value of the input parameter
     */
    func getModel(of characterName: String) -> CharacterModel
}
