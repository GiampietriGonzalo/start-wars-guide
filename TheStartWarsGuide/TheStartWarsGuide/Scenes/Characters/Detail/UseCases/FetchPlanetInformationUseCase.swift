//
//  FetchPlanetInformationUseCase.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

final class FetchPlanetInformationUseCase: FetchPlanetInformationUseCaseProtocol {
    private let repository: CharacterDetailRepositoryProtocol
    
    init(repository: CharacterDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with url: String) async throws -> PlanetModel {
        try await repository.fetchPlanetInformation(from: url)
    }
}
