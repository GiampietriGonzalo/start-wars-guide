//
//  CharacterListViewModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Observation

@Observable
final class CharacterListViewModel: CharacterListViewModelProtocol {
    
    private let fetchAllCharactersUseCase: FetchAllCharactersUseCaseProtocol
    private var characterModels: [CharacterListModel] = []
    var isLoading = false
    var characters: [CharacterListViewData]
    
    init(fetchAllCharactersUseCase: FetchAllCharactersUseCaseProtocol) {
        self.fetchAllCharactersUseCase = fetchAllCharactersUseCase
        self.characters = []
    }
    
    func loadContent() async {
        guard characters.isEmpty else { return }
        isLoading = true
        do {
            characterModels = try await fetchAllCharactersUseCase.execute()
            characters = characterModels.map{ CharacterListViewData(from: $0) }
            isLoading = false
        } catch let error as CustomError {
            isLoading = false
            switch error {
            case .networkError(let endpoint), .serviceError(let endpoint):
                //TODO: "Display a Feedback view specifing for the error and a retry button
                debugPrint("Network or service error | endpoint:", endpoint)
            case .decodeError(let endpoint):
                //TODO: Display a Feedack view with an unespected error message and a retry button
                debugPrint("Decode error | endpoint:", endpoint)
            case .invalidUrl(let endpoint):
                //TODO: Display a Feedack view with an unespected error message
                debugPrint("Invalid url:", endpoint)
            case .unknown:
                //TODO: Display a Feedack view with an unespected error message
                debugPrint("Unknown error")
            }
        } catch {
            isLoading = false
            //TODO: Display a Feedack view with an unespected error message
            debugPrint("Unknown error")
        }
    }
}
