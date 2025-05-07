//
//  CharacterListView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

struct CharacterListView<Coordinator: CharactersSceneCoordinatorViewModelProtocol>: View {
    var viewModel: CharacterListViewModelProtocol
    var coordinator: Coordinator
    @State var didEndFirstLoad = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading, !didEndFirstLoad {
                ProgressView() {
                    Text(CharacterListConstants.loading)
                        .font(.title3)
                }.onDisappear() {
                    didEndFirstLoad = true
                }
            } else {
                CharacterListBodyView(viewModel: viewModel, coordinator: coordinator)
            }
        }
        .navigationTitle(CharacterListConstants.title)
        .task {
            await viewModel.loadContent()
        }
    }
}

fileprivate struct CharacterListBodyView<Coordinator: CharactersSceneCoordinatorViewModelProtocol>: View {
    var viewModel: CharacterListViewModelProtocol
    var coordinator: Coordinator
    
    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                HStack {
                    CellWithImage(text: character.name, imageName: character.imageName)
                        .overlay {
                            Button("") {
//                                coordinator.push(.detail(character: viewModel.getModel(of: character.name)))
                            }
                            .opacity(0)
                    }
                    Image(systemName: ImageConstant.forwardButtonImage)
                }
            }
        }
        .listRowSeparator(.hidden)
        .scrollIndicators(.hidden)
        .listRowSpacing(8)
        .refreshable { await viewModel.loadContent() }
    }
}

#Preview {
    CharactersSceneCoordinatorView(viewModel: CharactersSceneCoordinatorViewModel.shared)
}
