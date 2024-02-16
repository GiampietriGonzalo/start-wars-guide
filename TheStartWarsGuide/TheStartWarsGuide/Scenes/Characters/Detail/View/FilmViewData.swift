//
//  CharacterFilmViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Foundation

struct FilmViewData: Identifiable {
    let id: UUID
    let name: String
    let episodeId: Int
    let releaseDate: String
    
    init(from model: FilmModel) {
        self.id = .init()
        self.name = model.title
        self.episodeId = model.episodeId
        self.releaseDate = model.releaseDate //TODO: Format date
    }
}
