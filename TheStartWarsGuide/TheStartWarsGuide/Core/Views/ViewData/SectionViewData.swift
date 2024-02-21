//
//  SectionViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 17/02/2024.
//

import Foundation

struct SectionViewData: Identifiable {
    var id = UUID()
    let title: String
    let items: [SectionItemViewData]
    var imageName: String? = nil
}

extension SectionViewData: Hashable {
    static func == (lhs: SectionViewData, rhs: SectionViewData) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension SectionViewData {
    static let mock = SectionViewData(id: .init(),
                                      title: "Millennium Falcon",
                                      items: [.vehicleNameMock,
                                              .vehicleModelMock,
                                              .vehicleClassMock,
                                              .vehicleLengthMock,
                                              .vehicleMaxSpeedMock,
                                              .vehicleCrewMock,
                                              .vehiclePassengersMock,
                                              .vehicleCargoCapicityMock,
                                              .vehicleCostMock],
                                      imageName: "Millennium Falcon")
}
