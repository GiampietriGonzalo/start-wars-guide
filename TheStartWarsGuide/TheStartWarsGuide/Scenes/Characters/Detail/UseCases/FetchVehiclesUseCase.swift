//
//  FetchVehiclesUseCase.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

final class FetchVehiclesUseCase: FetchVehiclesUseCaseProtocol {
    private let repository: CharacterDetailRepositoryProtocol
    
    init(repository: CharacterDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with urls: [String]) async throws -> [VehicleModel] {
        var vehicles: [VehicleModel] = []
        
        try await withThrowingTaskGroup(of: VehicleModel.self) { [weak self] group in
            guard let self else { throw CustomError.unknown }
            urls.forEach { url in
                group.addTask {
                    return try await self.repository.fetchVehicle(from: url)
                }
            }
            
            for try await vehicle in group {
                vehicles.append(vehicle)
            }
         }
        
        return vehicles
    }
}

