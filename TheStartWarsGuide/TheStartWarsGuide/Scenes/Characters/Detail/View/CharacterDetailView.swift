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
        VStack {
            if viewModel.isLoading, !didEndFirstLoad {
                CharacterDetailLoadingView(viewModel: viewModel,
                                           screenTitle: $screenTitle,
                                           backgroundColor: $backgroundColor)
            } else {
                CharacterDetailBodyView(viewModel: viewModel)
            }
        }
        .navigationTitle(screenTitle)
        .ignoresSafeArea(.all, edges: .bottom)
        .background(backgroundColor)
        .scrollIndicators(.hidden)
        .refreshable {
            await viewModel.loadContent()
        }
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
    @State var viewModel: CharacterDetailViewModelProtocol
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    CharacterDetailImageView(characterImageName: viewModel.viewData.title)
                        .frame(height: 200)
                        .padding(EdgeInsets(top: -16, leading: 0, bottom: -16, trailing: 0))
                    
                    VerticalSectionsView(sections: viewModel.viewData.listSections)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(.rect(cornerRadii: .init(topLeading: 16, bottomLeading: 8, bottomTrailing: 8, topTrailing: 16)))
                    
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
        CharactersSceneBuilder.shared.buildCharacterDetailView(for: .mock)
    }
    .navigationTitle("")
    .preferredColorScheme(.dark)
}
