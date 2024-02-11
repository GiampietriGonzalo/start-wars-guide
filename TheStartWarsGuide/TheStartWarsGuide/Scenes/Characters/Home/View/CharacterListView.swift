//
//  CharacterListView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

import SwiftUI

struct CharacterListView: View {
    var viewModel: CharacterListViewModel
    @State var didEndFirstLoad = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if viewModel.isLoading, !didEndFirstLoad {
                        ProgressView() {
                            Text(CharactersHomeConstants.loading)
                        }.onDisappear() {
                            didEndFirstLoad = true
                        }
                    } else {
                        Spacer(minLength: 16)
                        List {
                            ForEach(viewModel.characters) { character in
                                CellWithImage(text: character.name, imageName: character.name)
                            }
                        }
                        .navigationTitle(CharactersHomeConstants.title)
                        .listRowSeparator(.hidden)
                        .scrollIndicators(.hidden)
                        .listRowSpacing(8)
                        .refreshable { await viewModel.loadContent() }
                    }
                }
            }
            .task { await viewModel.loadContent() }
        }
    }
}

#Preview {
    CharacterListView(viewModel: .init(fetchAllCharactersUseCase: FetchAllCharactersUseCase(repository: CharacterListRepository())))
            .preferredColorScheme(.dark)
}
