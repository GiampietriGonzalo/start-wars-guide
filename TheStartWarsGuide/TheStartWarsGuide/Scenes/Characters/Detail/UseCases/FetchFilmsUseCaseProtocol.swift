//
//  FetchFilmsUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchFilmsUseCaseProtocol {
    func execute() async throws -> [FilmModel]
}
