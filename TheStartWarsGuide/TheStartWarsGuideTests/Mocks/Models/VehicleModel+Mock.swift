//
//  VehicleModel+Mock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

@testable import TheStartWarsGuide

extension VehicleModel {
    static let mock = VehicleModel(name: "vehicleOne",
                                   model: "modelOne",
                                   length: "123",
                                   maxAtmospheringSpeed: "1000",
                                   costInCredits: "10000",
                                   crew: "4",
                                   passengers: "6",
                                   cargoCapacity: "700",
                                   vehicleClass: "motorbike",
                                   starshipClass: "ship")
}
