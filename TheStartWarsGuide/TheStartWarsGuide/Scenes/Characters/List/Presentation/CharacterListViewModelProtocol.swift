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
}
