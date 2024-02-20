//
//  SectionItemViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 17/02/2024.
//

import Foundation

struct SectionItemViewData: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var image: String? = nil
}

extension SectionItemViewData {
    static let vehicleNameMock = SectionItemViewData(id: .init(), title: "Name", description: "Millennium Falcon", image: nil)
    static let vehicleModelMock = SectionItemViewData(id: .init(), title: "Model", description: "YT-1300 light freighter", image: nil)
    static let vehicleClassMock = SectionItemViewData(id: .init(), title: "Class", description: "Light freighter", image: nil)
    static let vehicleLengthMock = SectionItemViewData(id: .init(), title: "Length", description: "34.37", image: nil)
    static let vehicleMaxSpeedMock = SectionItemViewData(id: .init(), title: "Max speed", description: "1050", image: nil)
    static let vehicleCrewMock = SectionItemViewData(id: .init(), title: "Crew", description: "4", image: nil)
    static let vehiclePassengersMock = SectionItemViewData(id: .init(), title: "Passengers", description: "6", image: nil)
    static let vehicleCargoCapicityMock = SectionItemViewData(id: .init(), title: "Cargo capacity", description: "100000", image: nil)
    static let vehicleCostMock = SectionItemViewData(id: .init(), title: "Cost in credits", description: "100000", image: nil)
}
