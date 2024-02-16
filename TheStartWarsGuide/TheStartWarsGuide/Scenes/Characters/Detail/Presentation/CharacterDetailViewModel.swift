//
//  CharacterDetailViewModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Observation
import Foundation

@Observable
final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    private let fetchPlanetInformationUseCase: FetchPlanetInformationUseCaseProtocol
    private let fetchVehiclesUseCase: FetchVehiclesUseCaseProtocol
    private let fetchFilmsUseCase: FetchFilmsUseCaseProtocol
    
    @ObservationIgnored var characterModel: CharacterModel
    var viewData: CharacterDetailViewData = .empty
    var shouldReload = false
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
        let startDate = Date.now
        isLoading = true
        do {
            async let planetInformation = fetchPlanetInformationUseCase.execute(with: characterModel.homeworld)
            async let vehicles = fetchVehiclesUseCase.execute(with: characterModel.vehicles)
            async let starships = fetchVehiclesUseCase.execute(with: characterModel.starships)
            async let films = fetchFilmsUseCase.execute(with: characterModel.films)
            
            let characterInformationSection = getCharacterInformationSection()
            let homeworldSection = getPlanetInformationSection(from: try await planetInformation)
            let vehiclesSection = getVehiclesInformationSection(from: try await vehicles, title: CharacterDetailConstants.vehiclesSectionTitle)
            let starshipsSection = getVehiclesInformationSection(from: try await starships, title: CharacterDetailConstants.starshipsSectionTitle)
            let filmsSection = getFilmInformationSection(from: try await films)
            
            self.viewData = .init(title: characterModel.name,
                                  characterName: characterModel.name,
                                  listSections: [characterInformationSection, homeworldSection],
                                  carrouselSections: [filmsSection, starshipsSection, vehiclesSection])
            isLoading = false
            shouldReload = true
            debugPrint("time interval: \(DateInterval(start: startDate, end: .now).duration)")
        } catch let error as CustomError {
            self.isLoading = false
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
            self.isLoading = false
            //TODO: Display a Feedack view with an unespected error message
            debugPrint("Unknown error")
        }
    }
    
}

private extension CharacterDetailViewModel {
    
    func getCharacterInformationSection() -> VerticalSectionViewData {
        let characterName = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.name, description: characterModel.name, image: "person.text.rectangle")
        let characterHeight = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.height, description: characterModel.height, image: "ruler")
        let characterMass = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.mass, description: characterModel.mass, image: "scalemass")
        let characterHairColor = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.hairColor, description: characterModel.hairColor, image: "comb")
        let characterBirthYear = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.birthYear, description: characterModel.birthYear, image: "birthday.cake")
        let characterGender = SectionItemViewData(title: CharacterDetailConstants.CharacterDetail.gender, description: characterModel.gender, image: "person.fill.questionmark")
        
        return VerticalSectionViewData(title: CharacterDetailConstants.characterInformationTitle, items: [characterName,
                                                                                                                 characterMass,
                                                                                                                 characterHeight,
                                                                                                                 characterHairColor,
                                                                                                                 characterBirthYear,
                                                                                                                 characterGender])
    }
    
    func getPlanetInformationSection(from model: PlanetModel) -> VerticalSectionViewData {
        let name = SectionItemViewData(title: CharacterDetailConstants.PlanetInformation.name, description: model.name, image: "globe.americas")
        let climate = SectionItemViewData(title: CharacterDetailConstants.PlanetInformation.climate, description: model.climate, image: "cloud.sun")
        let terrain = SectionItemViewData(title: CharacterDetailConstants.PlanetInformation.terrain, description: model.terrain, image: "mountain.2")
        let gravity = SectionItemViewData(title: CharacterDetailConstants.PlanetInformation.gravity, description: model.gravity, image: "arrow.down")
        let population = SectionItemViewData(title: CharacterDetailConstants.PlanetInformation.population, description: model.population, image: "person.3")
        
        return VerticalSectionViewData(title: CharacterDetailConstants.planetTitle,
                                              items: [name, climate, terrain, gravity, population])
    }
    
    func getVehiclesInformationSection(from vehicles: [VehicleModel], title: String) -> VerticalSectionViewData {
        var items = [SectionItemViewData]()
        vehicles.forEach { vehicleModel in
            let vehicleClass: String = vehicleModel.vehicleClass ?? vehicleModel.starshipClass ?? ""
            let nameItem = SectionItemViewData(title: CharacterDetailConstants.VehicleInformation.name, description: vehicleModel.name, image: nil)
            let modelItem = SectionItemViewData(title: CharacterDetailConstants.VehicleInformation.model, description: vehicleModel.model, image: nil)
            let vehicleClassItem = SectionItemViewData(title: CharacterDetailConstants.VehicleInformation.vehicleClass, description: vehicleClass, image: nil)
            items.append(contentsOf: [nameItem, modelItem, vehicleClassItem])
        }
        
        return VerticalSectionViewData(title: title,
                                              items: items)
    }
    
    func getFilmInformationSection(from films: [FilmModel]) -> VerticalSectionViewData {
        var items = [SectionItemViewData]()
        films.forEach { film in
            let title = SectionItemViewData(title: CharacterDetailConstants.FilmInformation.title, description: film.title, image: nil)
            let episode = SectionItemViewData(title: CharacterDetailConstants.FilmInformation.episode, description: String(film.episodeId), image: nil)
            let releaseDate = SectionItemViewData(title: CharacterDetailConstants.FilmInformation.release, description: film.releaseDate, image: nil)
            items.append(contentsOf: [title, episode, releaseDate])
        }
        
        return VerticalSectionViewData(title: CharacterDetailConstants.filmsSectionTitle, items: items)
    }
}
