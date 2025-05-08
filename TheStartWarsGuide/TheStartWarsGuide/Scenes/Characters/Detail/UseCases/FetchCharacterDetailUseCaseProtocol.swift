//
//  FetchCharacterDetailUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri on 07/05/2025.
//

protocol FetchCharacterDetailUseCaseProtocol {
    
    /**
     *  Fetchs the information of the a character
     * - Parameters url: An  endpoint to fetch the character information
     * - Returns: A CharacterModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func execute(with url: String) async throws -> CharacterModel
}
