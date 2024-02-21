//
//  CharacterDetailViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

struct CharacterDetailViewData {
    let title: String
    let characterName: String
    let listSections: [SectionViewData]
    let carrouselSections: [CarrouselSectionViewData]
}

extension CharacterDetailViewData {
    static let empty = CharacterDetailViewData(title: "R2-D2", characterName: "", listSections: [], carrouselSections: [])
}
