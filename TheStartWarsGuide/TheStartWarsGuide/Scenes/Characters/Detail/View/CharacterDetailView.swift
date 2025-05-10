//
//  CharacterDetailView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

struct CharacterDetailView: View {
    
    var viewModel: CharacterDetailViewModelProtocol
    @State private var didEndFirstLoad = false
    @State private var screenTitle = CharacterDetailConstants.defaultTitle
    @State private var backgroundColor: Color = .characterDetailBrackgroundColor
    
    var body: some View {
        VStack {
            if viewModel.isLoading, !didEndFirstLoad {
                CharacterDetailLoadingView(viewModel: viewModel,
                                           screenTitle: $screenTitle,
                                           backgroundColor: $backgroundColor)
            } else {
                CharacterDetailBodyView(title: screenTitle, viewModel: viewModel)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(backgroundColor)
        .scrollIndicators(.hidden)
        .task {
            await viewModel.loadContent()
        }
    }
}

fileprivate struct CharacterDetailLoadingView : View {
    
    var viewModel: CharacterDetailViewModelProtocol
    @Binding var screenTitle: String
    @Binding var backgroundColor: Color
    @State private var didEndFirstLoad = false
    
    var body: some View {
        VStack {
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
        }
    }
}

fileprivate struct CharacterDetailBodyView: View {
    let title: String
    let viewModel: CharacterDetailViewModelProtocol
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    CharacterDetailImageView(characterImageName: viewModel.viewData.title)
                        .overlay(alignment: .bottom) {
                            HStack {
                                Spacer()
                                Text(title)
                                    .font(.largeTitle)
                                Spacer()
                            }
                            .padding(.bottom, 32)
                        }
                    
                    VerticalSectionsView(sections: viewModel.viewData.listSections)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(.rect(cornerRadii: .init(topLeading: 16, bottomLeading: 8, bottomTrailing: 8, topTrailing: 16)))
                        .padding(.top, -8)
                    
                    Spacer(minLength: 32)
                    
                    ForEach(viewModel.viewData.carrouselSections) { section in
                        CarrouselView(section: section, fullWidth: geometry.size.width)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CharactersSceneBuilder.shared.buildCharacterDetailView(for: "https://www.swapi.tech/api/people/1")
    }
    .navigationTitle("")
    .preferredColorScheme(.dark)
}
