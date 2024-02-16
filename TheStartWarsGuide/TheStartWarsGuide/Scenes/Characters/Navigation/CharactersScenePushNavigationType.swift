//
//  CharactersScenePushNavigationType.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import Foundation

enum CharactersScenePushNavigationType: PushNavigationType {
    case list
    case detail(character: CharacterModel)
    
    var id: UUID { UUID() }
}

extension CharactersScenePushNavigationType: Hashable {
    static func == (lhs: CharactersScenePushNavigationType, rhs: CharactersScenePushNavigationType) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
