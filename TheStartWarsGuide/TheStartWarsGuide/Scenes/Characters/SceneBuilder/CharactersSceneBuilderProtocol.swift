//
//  CharactersSceneBuilderProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

/**
 Builds the Views for the CharactersScene.
 */
protocol CharactersSceneBuilderProtocol {
    
    /**
     Builds and returns a CharacterListView
     - returns: A CharacterListView
     */
    func buildListView() -> CharacterListView<CharactersSceneCoordinatorViewModel>
    
    /**
     Builds and returns a CharacterDetailView
     - parameter characterUrl: The url of the character to display it's information
     - returns: A CharacterListView for the character associated to the parameter
     */
    func buildCharacterDetailView(for characterUrl: String) -> CharacterDetailView
}
