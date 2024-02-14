//
//  CharactersSceneCoordinatorView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import SwiftUI

/**
 Coordiantor View associated to the Characters scene.
 - Requires a viewModel of type CharactersSceneCoordinatorViewModel
 */
struct CharactersSceneCoordinatorView<ViewModel: CharactersSceneCoordinatorViewModel>: View {
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack(path: viewModel.navigationPathBinding) {
            viewModel.build(for: CharactersScenePushNavigationType.list)
                .navigationDestination(for: CharactersScenePushNavigationType.self) { pushItem in
                    viewModel.build(for: pushItem)
                }
                .sheet(item: viewModel.sheetItemBinding) { sheetItem in
                    viewModel.build(for: sheetItem)
                }
                .fullScreenCover(item: viewModel.fullScreenItemBinding) { fullScreenItem in
                    viewModel.build(for: fullScreenItem)
                }
        }
    }
}

#Preview {
    CharactersSceneCoordinatorView()
        .environment(CharactersSceneCoordinatorViewModel())
}

