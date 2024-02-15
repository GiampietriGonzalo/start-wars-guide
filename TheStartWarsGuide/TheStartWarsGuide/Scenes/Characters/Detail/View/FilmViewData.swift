//
//  CharacterFilmViewData.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

struct FilmViewData {
    let name: String
    let episodeId: String
    let releaseDate: String
    
    init(from model: FilmModel) {
        self.name = model.name
        self.episodeId = model.episodeId
        self.releaseDate = model.episodeId //TODO: Format date
    }
}
