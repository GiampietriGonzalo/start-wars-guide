//
//  CharactersSceneBuilderProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 15/02/2024.
//

protocol CharactersSceneBuilderProtocol {
    func buildListView() -> CharacterListView<CharactersSceneCoordinatorViewModel>
    func buildCharacterDetailView(for characterModel: CharacterModel) -> CharacterDetailView
}
