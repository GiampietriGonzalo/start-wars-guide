//
//  CharactersScenePushNavigationType.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import Foundation

enum CharactersScenePushNavigationType: PushNavigationType {
    case list
    case detail
    
    var id: UUID { UUID() }
}
