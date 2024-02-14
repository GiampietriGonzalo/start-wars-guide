//
//  CharactersSceneBuilder.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 10/02/2024.
//

import Foundation

/**
 Builds the Views for the CharactersScene.
 - Important: Conforms the Singleton pattern. Must use the **shared** property.
 - Note: Maintains a single reference to an optional CharacterListViewModelProtocol.
 */
final class CharactersSceneBuilder {
    
    static let shared = CharactersSceneBuilder()
    private var characterListViewModel: CharacterListViewModelProtocol?
    
    private init() {}
    
    func buildListView() -> CharacterListView<CharactersSceneCoordinatorViewModel> {
        guard let characterListViewModel else {
            let fetchAllCharacterUseCase = FetchAllCharactersUseCase(repository: buildListRepository())
            characterListViewModel = CharacterListViewModel(fetchAllCharactersUseCase: fetchAllCharacterUseCase)
            return CharacterListView(viewModel: characterListViewModel!, coordinator: .shared)
        }
       
        return CharacterListView(viewModel: characterListViewModel, coordinator: .shared)
    }
    
    //MARK: Build CharterDetailView
    func buildCharacterDetailView() -> CharacterDetailView {
        CharacterDetailView()
    }
}

private extension CharactersSceneBuilder {
    func buildListRepository() -> CharacterListRepositoryProtocol {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60 * 5
        let networkingClient = NetworkingRestClient(sessionConfiguration: configuration)
        
        return CharacterListRepository(networkingClient: networkingClient)
    }
}
