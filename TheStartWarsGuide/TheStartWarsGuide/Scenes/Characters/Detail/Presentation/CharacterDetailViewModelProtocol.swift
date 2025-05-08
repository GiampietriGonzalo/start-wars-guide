//
//  CharacterDetailViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

/**
 The view model associated to the CharacterDetail screen
 */
protocol CharacterDetailViewModelProtocol {
    /**
     Determinates if the view model is performing an asynchronous call in order to display a loading view
     */
    var isLoading: Bool { get }
    var characterUrl: String { get set }
    var characterModel: CharacterModel? { get set }
    var viewData: CharacterDetailViewData { get }
    
    /**
     Performs an asynchronous call to fetch the character information
     */
    func loadContent() async
}
