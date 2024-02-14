//
//  FetchVehiclesInformationUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchVehiclesInformationUseCaseProtocol {
    func execute() async throws -> [ShipModel]
}
