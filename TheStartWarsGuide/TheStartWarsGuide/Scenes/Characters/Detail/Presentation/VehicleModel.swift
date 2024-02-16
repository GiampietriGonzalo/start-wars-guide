//
//  VehicleModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct VehicleModel: Decodable {
    let name: String
    let model: String
    var vehicleClass: String?
    var starshipClass: String?
}
