//
//  CharacterListViewModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

import Observation

@Observable
final class CharacterListViewModel: CharacterListViewModelProtocol {
    
    private let fetchAllCharactersUseCase: FetchAllCharactersUseCaseProtocol
    var isLoading = false
    var characters: [CharacterListViewData]
    
    init(fetchAllCharactersUseCase: FetchAllCharactersUseCaseProtocol) {
        self.fetchAllCharactersUseCase = fetchAllCharactersUseCase
        self.characters = []
    }
    
    func loadContent() async {
        isLoading = true
        do {
            async let charactersModel = fetchAllCharactersUseCase.execute()
            characters = try await charactersModel.map{ CharacterListViewData(from: $0) }
            isLoading = false
        } catch let error as CustomError {
            isLoading = false
            switch error {
            case .networkError, .serviceError:
                //TODO: "Display a Feedback view specifing for the error and a retry button
                debugPrint("Network or service error")
            case .decodeError:
                //TODO: Display a Feedack view with an unespected error message and a retry button
                debugPrint("Decode error: please check the DTO body and compare it with the service response")
            case .invalidUrl:
                //TODO: Display a Feedack view with an unespected error message
                debugPrint("Invalid url: please check the url of the repository")
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
