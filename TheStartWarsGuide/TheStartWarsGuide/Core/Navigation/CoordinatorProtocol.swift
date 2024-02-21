//
//  CoordinatorProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

/**
 Manages and coordinates navigations
 */
protocol CoordinatorProtocol {
    associatedtype NavigationType = NavigationTypeProtocol
}

/**
 Manages and coordinates  Push navigations in a Stack
 - Requires a PushNavigationType
 */
protocol PushCoordinatorProtocol: CoordinatorProtocol where NavigationType: PushNavigationType {
    func push(_ item: NavigationType)
    func pop()
    func popToRoot()
}

/**
 Manages and coordinates  Sheet navigations
 - Requires a SheetNavigationType
 */
protocol SheetCoordinatorProtocol: CoordinatorProtocol where NavigationType: SheetNavigationType {
    func present(_ item: NavigationType)
    func dismissSheet()
}

/**
 Manages and coordinates  fullscreen navigations
 - Requires a FullScreenNavigationType
 */
protocol FullScreenCoordinatorProtocol: CoordinatorProtocol where NavigationType: FullScreenNavigationType {
    func present(_ item: NavigationType)
    func dismissFullScreen()
}
