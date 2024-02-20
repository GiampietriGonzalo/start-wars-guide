//
//  VehicleModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct VehicleModel: Decodable {
    let name: String
    let model: String
    let length: String
    let maxAtmospheringSpeed: String
    let costInCredits: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    var vehicleClass: String?
    var starshipClass: String?
}
