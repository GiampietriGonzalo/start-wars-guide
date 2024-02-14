//
//  FetchStarshipsInformationUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchStarshipsInformationUseCaseProtocol {
    func execute() async throws -> [ShipModel]
}
