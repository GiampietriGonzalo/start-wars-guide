//
//  CharacterDetailViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol CharacterDetailViewModelProtocol {
    var isLoading: Bool { get }
    var characterModel: CharacterModel { get set }
    var viewData: CharacterDetailViewData { get }
    func loadContent() async
}
