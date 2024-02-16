//
//  CharacterDetailView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var viewModel: CharacterDetailViewModelProtocol
    @State private var didEndFirstLoad = false
    @State private var screenTitle = CharacterDetailConstants.defaultTitle
    
    var body: some View {
        VStack {
            if viewModel.isLoading, !didEndFirstLoad {
                ProgressView() {
                    Text(CharacterDetailConstants.loading)
                        .font(.title3)
                }
                .onAppear() {
                    screenTitle = CharacterDetailConstants.defaultTitle
                }
                .onDisappear() {
                    didEndFirstLoad = true
                    screenTitle = viewModel.viewData.title
                }
            } else {
                CharacterDetailImageView(characterImageName: viewModel.viewData.title)
                VerticalSectionsView(sections: viewModel.viewData.listSections)
            }
        }
        .navigationTitle(screenTitle)
        .refreshable {
            await viewModel.loadContent()
        }
        .task {
            await viewModel.loadContent()
        }
    }
}

#Preview {
    CharactersSceneBuilder.shared.buildCharacterDetailView(for: .mock)
}
