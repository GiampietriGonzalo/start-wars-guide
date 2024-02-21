//
//  TheStartWarsGuideApp.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

@main
struct TheStartWarsGuideApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersSceneCoordinatorView(viewModel: CharactersSceneCoordinatorViewModel.shared)
                .preferredColorScheme(.dark)
        }
    }
}
