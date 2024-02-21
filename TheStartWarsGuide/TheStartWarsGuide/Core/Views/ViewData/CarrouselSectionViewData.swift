//
//  CarrouselSectionViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 17/02/2024.
//

import Foundation

struct CarrouselSectionViewData: Identifiable {
    var id: UUID = .init()
    let title: String
    let items: [SectionViewData]
    var type: CarrouselSectionType = .large
}
