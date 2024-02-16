//
//  CharacterDetailViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Foundation

struct CharacterDetailViewData {
    let title: String
    let characterName: String
    let listSections: [VerticalSectionViewData]
    let carrouselSections: [VerticalSectionViewData]
}

extension CharacterDetailViewData {
    static let empty = CharacterDetailViewData(title: "", characterName: "", listSections: [], carrouselSections: [])
}

struct VerticalSectionViewData: Identifiable {
    var id = UUID()
    let title: String
    let items: [SectionItemViewData]
}

struct SectionItemViewData: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var image: String?
}

