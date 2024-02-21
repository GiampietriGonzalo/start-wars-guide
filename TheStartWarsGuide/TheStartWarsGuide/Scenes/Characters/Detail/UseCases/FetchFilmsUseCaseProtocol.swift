//
//  FetchFilmsUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

protocol FetchFilmsUseCaseProtocol {
    
    /**
     *  Fetchs the information of the films where a character appears
     * - Parameters url: An array of endpoint to fetch the films information
     * - Returns: An array of FilmModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func execute(with urls: [String]) async throws -> [FilmModel]
}
