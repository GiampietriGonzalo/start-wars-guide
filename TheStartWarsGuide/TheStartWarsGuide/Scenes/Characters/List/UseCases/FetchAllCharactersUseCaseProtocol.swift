//
//  FetchAllCharactersUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

protocol FetchAllCharactersUseCaseProtocol {
    
    /**
     *  Sort, map and returns an array with all the characters
     * - Returns: An sorted array with all the characters
     * - Throws: CustomError.unknown if self reference is miss. Propagates Custom Errors from the repository
     */
    func execute() async throws -> [CharacterListModel]
}
