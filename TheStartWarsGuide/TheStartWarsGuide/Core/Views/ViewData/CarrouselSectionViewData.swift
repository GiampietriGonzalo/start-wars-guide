//
//  CarrouselSectionViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

struct CarrouselSectionViewData: Identifiable {
    var id: UUID = .init()
    let title: String
    let items: [SectionViewData]
    var type: CarrouselSectionType = .large
}
