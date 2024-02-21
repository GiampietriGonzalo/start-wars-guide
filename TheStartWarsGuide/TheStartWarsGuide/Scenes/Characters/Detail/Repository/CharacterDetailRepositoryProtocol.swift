//
//  CharacterDetailRepositoryProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

protocol CharacterDetailRepositoryProtocol {
    /**
     *  Fetchs the information of a planet
     * - Parameter url: The endpoint to fetch the information
     * - Returns: A PlanetModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func fetchPlanetInformation(from url: String) async throws -> PlanetModel
    
    /**
     *  Fetchs the information of a vehicle
     * - Parameter url: The endpoint to fetch the information
     * - Returns: A VehicleModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func fetchVehicle(from url: String) async throws -> VehicleModel
    
    /**
     *  Fetchs the information of a film
     * - Parameter url: The endpoint to fetch the information
     * - Returns: A FilmModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func fetchFilm(from url: String) async throws -> FilmModel
}
