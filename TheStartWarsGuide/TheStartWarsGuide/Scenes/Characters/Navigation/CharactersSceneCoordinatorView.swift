//
//  CharactersSceneCoordinatorView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import SwiftUI

/**
 Coordinator View associated to the Characters scene.
 - Requires a viewModel of type CharactersSceneCoordinatorViewModel
 */
struct CharactersSceneCoordinatorView<ViewModel: CharactersSceneCoordinatorViewModelProtocol>: View {
    var viewModel: ViewModel
    
    var body: some View {
        NavigationStack(path: viewModel.navigationPathBinding) {
            viewModel.build(for: CharactersScenePushNavigationType.list)
                .navigationDestination(for: CharactersScenePushNavigationType.self) { pushItem in
                    viewModel.build(for: pushItem)
                }
        }
    }
}

#Preview {
    CharactersSceneCoordinatorView(viewModel: CharactersSceneCoordinatorViewModel.shared)
}
