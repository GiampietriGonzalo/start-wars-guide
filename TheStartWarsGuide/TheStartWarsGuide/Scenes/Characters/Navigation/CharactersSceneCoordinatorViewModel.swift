//
//  CharactersSceneCoordinatorViewModel.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import SwiftUI
import Observation

/**
 Manages and handles the navigation state for the Characters scene
 - Requires a NavigationPath
 - Important: Conforms the Singleton pattern. Must use the **shared** property.
 */

@Observable
final class CharactersSceneCoordinatorViewModel: CharactersSceneCoordinatorViewModelProtocol {
    var navigationPath = NavigationPath()
    static let shared = CharactersSceneCoordinatorViewModel()
    
    private init() {}
    
    //MARK: Binding
    var navigationPathBinding: Binding<NavigationPath> {
        Binding(get: { self.navigationPath },
                set: { self.navigationPath = $0 })
    }
    
    //MARK: Navigation methods
    func push(_ item: NavigationType) {
        self.navigationPath.append(item)
    }
    
    func pop() {
        guard !navigationPath.isEmpty else { return }
        self.navigationPath.removeLast()
    }
    
    func popToRoot() {
        guard !navigationPath.isEmpty else { return }
        self.navigationPath.removeLast(navigationPath.count)
    }
    
    
    //MARK: Building methods
    @ViewBuilder func build(for item: NavigationType) -> some View {
        switch item {
        case .list:
            CharactersSceneBuilder.shared.buildListView()
        case .detail:
            //TODO: Inject dependencies. Declare it in PushItem enum
            CharactersSceneBuilder.shared.buildCharacterDetailView()
        }
    }
}
