//
//  CharactersSceneCoordinatorViewModelProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
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
   
    /**
     Builds the View associated to the navigation item type
     - parameter item: A NavigationType that determinates what View should be build
     */
    @ViewBuilder func build(for item: NavigationType) -> SomeView
}
