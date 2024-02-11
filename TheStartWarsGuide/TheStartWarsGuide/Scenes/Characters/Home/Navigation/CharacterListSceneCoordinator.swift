//
//  CharacterListSceneCoordinator.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 10/02/2024.
//

struct CharacterListSceneCoordinator {
    func start() -> CharacterListView {
        let sceneBuilder = CharacterListSceneBuilder()
        return sceneBuilder.build()
    }
}
