//
//  FetchPlanetInformationUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchPlanetInformationUseCaseProtocol {
    
    /**
     *  Fetchs the information of a planet
     * - Parameter url: The endpoint to fetch the information
     * - Returns: A PlanetModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func execute(with url: String) async throws -> PlanetModel
}
