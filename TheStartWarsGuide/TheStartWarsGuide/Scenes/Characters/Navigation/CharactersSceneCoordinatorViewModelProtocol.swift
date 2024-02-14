//
//  CharactersSceneCoordinatorViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 12/02/2024.
//

import SwiftUI
import Observation

/**
 Manages and handles the navigation state for the Characters scene
 - Requires a NavigationPath
 */
protocol CharactersSceneCoordinatorViewModelProtocol: PushCoordinatorProtocol where NavigationType == CharactersScenePushNavigationType {
    associatedtype SomeView: View
    
    var navigationPath: NavigationPath { get }
    var navigationPathBinding: Binding<NavigationPath> { get }
    
    @ViewBuilder func build(for item: NavigationType) -> SomeView
}
