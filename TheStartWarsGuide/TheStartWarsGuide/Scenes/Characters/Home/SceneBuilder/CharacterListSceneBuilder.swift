//
//  CharacterListSceneBuilder.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 10/02/2024.
//

import Foundation

struct CharacterListSceneBuilder {
    func build() -> CharacterListView {
        let fetchAllCharactersUseCase = FetchAllCharactersUseCase(repository: buildRepository())
        let viewModel = CharacterListViewModel(fetchAllCharactersUseCase: fetchAllCharactersUseCase)
        let view = CharacterListView(viewModel: viewModel)
        
        return view
    }
    
    private func buildRepository() -> CharacterListRepositoryProtocol {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60 * 5
        
        return CharacterListRepository(sessionConfiguration: configuration)
    }
}
