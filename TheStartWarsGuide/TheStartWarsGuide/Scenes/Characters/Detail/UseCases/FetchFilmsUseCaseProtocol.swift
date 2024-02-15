//
//  FetchFilmsUseCaseProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

protocol FetchFilmsUseCaseProtocol {
    func execute(with urls: [String]) async throws -> [FilmModel]
}
