//
//  FetchFilmsUseCase.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

final class FetchFilmsUseCase: FetchFilmsUseCaseProtocol {
    private let repository: CharacterDetailRepositoryProtocol
    
    init(repository: CharacterDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with urls: [String]) async throws -> [FilmModel] {
        var films: [FilmModel] = []
        
        try await withThrowingTaskGroup(of: FilmModel.self) { [weak self] group in
            guard let self else { throw CustomError.unknown }
            urls.forEach { url in
                group.addTask {
                    return try await self.repository.fetchFilm(from: url)
                }
            }
            
            for try await film in group {
                films.append(film)
            }
         }
        
        return films
    }
}
