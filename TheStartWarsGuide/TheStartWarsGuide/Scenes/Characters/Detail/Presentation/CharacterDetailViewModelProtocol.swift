//
//  CharacterDetailViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

/**
 The view model associated to the CharacterDetail screen
 */
protocol CharacterDetailViewModelProtocol {
    /**
     Determinates if the view model is performing an asynchronous call in order to display a loading view
     */
    var isLoading: Bool { get }
    var characterModel: CharacterModel { get set }
    var viewData: CharacterDetailViewData { get }
    
    /**
     Performs an asynchronous call to fetch the character information
     */
    func loadContent() async
}
