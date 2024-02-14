//
//  CharacterListView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
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
                }.onDisappear() {
                    didEndFirstLoad = true
                }
            } else {
                List {
                    ForEach(viewModel.characters) { character in
                        CellWithImage(text: character.name, imageName: character.name)
                            .overlay {
                                Button("") {
                                    coordinator.push(.detail)
                                }
                                .opacity(0)
                            }
                    }
                }
                .listRowSeparator(.hidden)
                .scrollIndicators(.hidden)
                .listRowSpacing(8)
                .refreshable { await viewModel.loadContent() }
            }
        }
        .navigationTitle(CharacterListConstants.title)
        .task {
            await viewModel.loadContent()
        }
    }
}

#Preview {
    CharactersSceneBuilder.shared.buildListView()
        .preferredColorScheme(.dark)
}
