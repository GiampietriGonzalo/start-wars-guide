//
//  NavigationTypeProtocols.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 13/02/2024.
//

protocol NavigationTypeProtocol: Identifiable {}

/**
    Determinates a set of push navigation destinations for the scene
 */
protocol PushNavigationType: NavigationTypeProtocol {}

/**
    Determinates a set of sheet navigation destinations for the scene
 */
protocol SheetNavigationType: NavigationTypeProtocol {}

/**
    Determinates a set of fulll screen navigation destinations for the scene
 */
protocol FullScreenNavigationType: NavigationTypeProtocol {}
