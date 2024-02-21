//
//  FetchVehiclesUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchVehiclesUseCaseProtocol {
    /**
     *  Fetchs the information about the vehicles used by a character
     * - Parameters url: An array of endpoint to fetch the vehicles information
     * - Returns: An array of VehicleModel with the information fetched
     * - Throws: An error if something goes wrong
     */
    func execute(with urls: [String]) async throws -> [VehicleModel]
}
