//
//  CharacterDetailConstants.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

struct CharacterDetailConstants {
    static let defaultTitle = ""
    static let loading = "Loading..."
    static let characterInformationTitle = "Information"
    static let planetTitle = "Homeworld"
    static let vehiclesSectionTitle = "Vehicles"
    static let starshipsSectionTitle = "Starships"
    static let filmsSectionTitle = "Movies"
    
    struct CharacterDetail {
        static let name = "Name"
        static let height = "Height"
        static let mass = "Mass"
        static let hairColor = "Hair color"
        static let skinColor = "Skin color"
        static let eyeColor = "Eye color"
        static let birthYear = "Birth year"
        static let gender = "Gender"
    }
    
    struct PlanetInformation {
        static let name = "Name"
        static let climate = "Climate"
        static let terrain = "Terrain"
        static let gravity = "Gravity"
        static let population = "Population"
    }
    
    struct VehicleInformation {
        static let name = "Name" 
        static let model = "Model"
        static let vehicleClass = "Class"
        static let length = "Length"
        static let speed = "Max speed"
        static let crew = "Crew"
        static let passengers = "Passengers"
        static let cargoCapacity = "Cargo capacity"
        static let cost = "Cost in credits"
    }
    
    struct FilmInformation {
        static let title = "Title"
        static let episode = "Episode"
        static let release = "Release Date"
    }
}
