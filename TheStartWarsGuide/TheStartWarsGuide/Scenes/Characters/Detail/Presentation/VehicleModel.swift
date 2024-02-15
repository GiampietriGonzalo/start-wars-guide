//
//  VehicleModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct VehicleModel: Decodable {
    let name: String
    let model: String
    let terrain: String
    let gravity: String
    let population: String
    var vehicleClass: String?
    var starshipClass: String?
}
