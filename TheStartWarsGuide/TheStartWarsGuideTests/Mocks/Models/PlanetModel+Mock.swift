//
//  PlanetModel+Mock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

@testable import TheStartWarsGuide

extension PlanetModel {
    static let mock = PlanetModel(name: "Earth",
                                  climate: "wet",
                                  terrain: "mountain",
                                  gravity: "standar 1",
                                  population: "7880000000")
}
