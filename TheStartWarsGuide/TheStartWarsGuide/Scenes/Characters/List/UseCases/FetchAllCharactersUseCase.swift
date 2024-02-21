//
//  FetchAllCharactersUseCase.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

final class FetchAllCharactersUseCase: FetchAllCharactersUseCaseProtocol {
    private let repository: CharacterListRepositoryProtocol
    private var numberOfPages = 1
    
    init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [CharacterModel] {
        var characters = [CharacterModel]()
        
        // 1. Make the first fetch
        async let firstCharactersList = try await repository.fetch(pageNumber: 1)
        guard try await !firstCharactersList.results.isEmpty else {
            return []
        }
        
        characters = try await firstCharactersList.results.map { CharacterModel(from: $0) }
        
        // 2. Inspect characters count and the results array count in orden to calculate the remaining services calls.
        let charactersPerPage = try await (firstCharactersList.count / firstCharactersList.results.count)
        let modulo = try await (firstCharactersList.count % firstCharactersList.results.count)
        let totalCalls = modulo == .zero ? charactersPerPage : charactersPerPage + 1
        
        guard totalCalls > 1 else {
            return characters
        }
       
        // 3. Perform the remainin calls
        var callsResults = [Int: [CharacterModel]]() //Useful to sort the results using the page number
        
        try await withThrowingTaskGroup(of: (Int, [CharacterModel]).self) { [weak self] group in
            guard let self else { throw CustomError.unknown }
            
            for pageNumber in 2...totalCalls {
                group.addTask {
                    async let pageCharacters = self.repository.fetch(pageNumber: pageNumber).results.map { CharacterModel(from: $0) }
                    return (pageNumber, try await pageCharacters)
                }
            }
            
            for try await (pageNumber, characterList) in group {
                callsResults[pageNumber] = characterList
            }
                        
            // 4. Sort by page number and append the arrays of characters
            for (_, characterList) in callsResults.sorted(by: { $0.key < $1.key }) {
                characters.append(contentsOf: characterList)
            }
        }
        
        return characters
    }
}
