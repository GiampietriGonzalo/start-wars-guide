//
//  FetchCharacterDetailUseCase.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri on 07/05/2025.
//

final class FetchCharacterDetailUseCase: FetchCharacterDetailUseCaseProtocol {
    
    private let repository: CharacterDetailRepositoryProtocol
    
    init(repository: CharacterDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with url: String) async throws -> CharacterModel {
        let dto = try await repository.fetchCharacterDetail(with: url)
        return CharacterModel(from: dto.result.properties)
    }
}
