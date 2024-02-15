//
//  VehicleViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct VehicleViewData {
    let name: String
    let model: String
    let vehicleClass: String
    
    init(from model: VehicleModel) {
        self.name = model.name
        self.model = model.model
        
        if let vehicleClass = model.vehicleClass {
            self.vehicleClass = vehicleClass
        } else if let vehicleClass = model.starshipClass {
            self.vehicleClass = vehicleClass
        } else {
            self.vehicleClass = "Unknown"
        }
    }
}
