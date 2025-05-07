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
    private var charactersPerPage: Int
    
    init(repository: CharacterListRepositoryProtocol, charactersPerPage: Int) {
        self.repository = repository
        self.charactersPerPage = charactersPerPage
    }
    
    func execute() async throws -> [CharacterListModel] {
        var characters = [CharacterListModel]()
        
        // 1. Make the first fetch
        async let firstCharactersList = try await repository.fetch(pageNumber: 1, limit: charactersPerPage)
        guard try await !firstCharactersList.results.isEmpty else {
            return []
        }
        
        characters = try await firstCharactersList.results.map { CharacterListModel(from: $0) }
        
        // 2. Inspect characters count and the results array count in orden to calculate the remaining services calls.
        let totalCalls = try await firstCharactersList.totalPages
        
        guard totalCalls > 1 else {
            return characters
        }
       
        // 3. Perform the remainin calls
        var callsResults = [Int: [CharacterListModel]]() //Useful to sort the results using the page number
        
        try await withThrowingTaskGroup(of: (Int, [CharacterListModel]).self) { [weak self] group in
            guard let self else { throw CustomError.unknown }
            
            for pageNumber in 2...totalCalls {
                group.addTask {
                    async let pageCharacters = self.repository.fetch(pageNumber: pageNumber,
                                                                     limit: self.charactersPerPage).results.map { CharacterListModel(from: $0) }
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
