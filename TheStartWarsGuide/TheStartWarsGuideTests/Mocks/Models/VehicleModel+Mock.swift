//
//  VehicleModel+Mock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
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
