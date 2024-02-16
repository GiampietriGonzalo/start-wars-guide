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
    @State private var backgroundColor: Color = .characterDetailBrackgroundColor
    
    var body: some View {
        VStack() {
            if viewModel.isLoading, !didEndFirstLoad {
                ProgressView() {
                    Text(CharacterDetailConstants.loading)
                        .font(.title3)
                }
                .onAppear() {
                    backgroundColor = .clear
                    screenTitle = CharacterDetailConstants.defaultTitle
                }
                .onDisappear() {
                    didEndFirstLoad = true
                    backgroundColor = .characterDetailBrackgroundColor
                    screenTitle = viewModel.viewData.title
                }
            } else {
                CharacterDetailImageView(characterImageName: viewModel.viewData.title)
                    .frame(height: 200)
                    .padding(EdgeInsets(top: -16, leading: 0, bottom: -16, trailing: 0))
                
                VerticalSectionsView(sections: viewModel.viewData.listSections)
                    .scrollIndicators(.hidden)
                    .clipShape(.rect(cornerSize: CGSize(width: 16, height: 16)))
                
                //TODO: Carrousel items
            }
        }
        .navigationTitle(screenTitle)
        .ignoresSafeArea(.all, edges: .bottom)
        .background(backgroundColor)
        .refreshable {
            await viewModel.loadContent()
        }
        .task {
            await viewModel.loadContent()
        }
    }
}

#Preview {
    NavigationStack {
        CharactersSceneBuilder.shared.buildCharacterDetailView(for: .mock)
    }
    .navigationTitle("")
//    .preferredColorScheme(.dark)
}
