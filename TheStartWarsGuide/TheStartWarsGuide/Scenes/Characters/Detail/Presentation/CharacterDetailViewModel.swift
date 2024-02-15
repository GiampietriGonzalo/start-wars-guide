//
//  CharacterDetailViewModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Observation

final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    private let characterModel: CharacterModel
    private let fetchPlanetInformationUseCase: FetchPlanetInformationUseCaseProtocol
    private let fetchVehiclesUseCase: FetchVehiclesUseCaseProtocol
    private let fetchFilmsUseCase: FetchFilmsUseCaseProtocol
    
    var viewData: CharacterDetailViewData = .empty
    var isLoading = false
    
    init(characterModel: CharacterModel,
         fetchPlanetInformationUseCase: FetchPlanetInformationUseCaseProtocol,
         fetchVehiclesUseCase: FetchVehiclesUseCaseProtocol,
         fetchFilmsUseCase: FetchFilmsUseCaseProtocol) {
        self.characterModel = characterModel
        self.fetchPlanetInformationUseCase = fetchPlanetInformationUseCase
        self.fetchVehiclesUseCase = fetchVehiclesUseCase
        self.fetchFilmsUseCase = fetchFilmsUseCase
    }
    
    func loadContent() async {
        do {
            async let planetInformation = fetchPlanetInformationUseCase.execute(with: characterModel.homeworld)
            async let vehicles = fetchVehiclesUseCase.execute(with: characterModel.vehicles)
            async let starships = fetchVehiclesUseCase.execute(with: characterModel.starships)
            async let films = fetchFilmsUseCase.execute(with: characterModel.films)
            
            let planetViewData = PlanetViewData(from: try await planetInformation)
            let vehiclesViewData = try await vehicles.map { VehicleViewData(from: $0) }
            let starshipsViewData = try await starships.map { VehicleViewData(from: $0) }
            let filmsViewData = try await films.map { FilmViewData(from: $0) }
            
            viewData = .init(planet: planetViewData,
                             vehicles: vehiclesViewData,
                             starships: starshipsViewData,
                             films: filmsViewData)
            
        } catch let error as CustomError {
            isLoading = false
            switch error {
            case .networkError, .serviceError:
                //TODO: "Display a Feedback view specifing for the error and a retry button
                debugPrint("Network or service error")
            case .decodeError:
                //TODO: Display a Feedack view with an unespected error message and a retry button
                debugPrint("Decode error: please check the DTO body and compare it with the service response")
            case .invalidUrl:
                //TODO: Display a Feedack view with an unespected error message
                debugPrint("Invalid url: please check the url of the request")
            case .unknown:
                //TODO: Display a Feedack view with an unespected error message
                debugPrint("Unknown error")
            }
        } catch {
            isLoading = false
            //TODO: Display a Feedack view with an unespected error message
            debugPrint("Unknown error")
        }
    }
    
}
