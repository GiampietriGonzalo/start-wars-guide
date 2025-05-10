//
//  PlanetModel+Mock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

@testable import TheStartWarsGuide

extension PlanetDTO {
    static let mock = PlanetDTO(result: .init(properties: .init(name: "Earth",
                                                                climate: "wet",
                                                                terrain: "mountain",
                                                                gravity: "standar 1",
                                                                population: "7880000000")))
}
