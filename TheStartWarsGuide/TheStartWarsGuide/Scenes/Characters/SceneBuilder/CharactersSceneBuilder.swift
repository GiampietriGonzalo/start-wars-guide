//
//  CharactersSceneBuilder.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

/**
 Builds the Views for the CharactersScene.
 - Important: Conforms the Singleton pattern. Must use the **shared** property.
 - Note: Maintains a single reference to an optional CharacterListViewModelProtocol.
 */
final class CharactersSceneBuilder: CharactersSceneBuilderProtocol {
    
    static let shared = CharactersSceneBuilder()
    private let networkingClient = NetworkingRestClient.shared
    private var characterListViewModel: CharacterListViewModelProtocol?
    private var characterDetailViewModel: CharacterDetailViewModelProtocol?
    
    private init() {
        configureNetworkingClient()
    }
    
    //MARK: Build CharterListView
    func buildListView() -> CharacterListView<CharactersSceneCoordinatorViewModel> {
        guard let characterListViewModel else {
            let repository = CharacterListRepository(networkingClient: networkingClient)
            let fetchAllCharacterUseCase = FetchAllCharactersUseCase(repository: repository)
            characterListViewModel = CharacterListViewModel(fetchAllCharactersUseCase: fetchAllCharacterUseCase)
            return CharacterListView(viewModel: characterListViewModel!, coordinator: .shared)
        }
      
        return CharacterListView(viewModel: characterListViewModel, coordinator: .shared)
    }
    
    //MARK: Build CharterDetailView
    func buildCharacterDetailView(for characterModel: CharacterModel) -> CharacterDetailView {
        guard var characterDetailViewModel else {
            let repository = CharacterDetailRepository(networkingClient: networkingClient)
            let fetchPlanetInformationUsecase = FetchPlanetInformationUseCase(repository: repository)
            let fetchVehiclesUseCase = FetchVehiclesUseCase(repository: repository)
            let fetchFilmsUseCase = FetchFilmsUseCase(repository: repository)
            characterDetailViewModel = CharacterDetailViewModel(characterModel: characterModel,
                                                     fetchPlanetInformationUseCase: fetchPlanetInformationUsecase,
                                                     fetchVehiclesUseCase: fetchVehiclesUseCase,
                                                     fetchFilmsUseCase: fetchFilmsUseCase)
            return CharacterDetailView(viewModel: characterDetailViewModel!)
        }
    
        characterDetailViewModel.characterModel = characterModel
        return CharacterDetailView(viewModel: characterDetailViewModel)
    }
}

private extension CharactersSceneBuilder {
    func configureNetworkingClient() {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60 * 5
        networkingClient.configure(with: configuration)
    }
}
