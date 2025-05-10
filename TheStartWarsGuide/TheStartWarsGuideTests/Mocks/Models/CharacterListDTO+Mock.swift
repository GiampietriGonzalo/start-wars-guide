//
//  CharacterListDTO+Mock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

@testable import TheStartWarsGuide

extension CharacterListDTO {
    static let mock = CharacterListDTO(totalRecords: 1,
                                       totalPages: 1,
                                       results: [.init(uid: "1", name: "Luke Skywalker", url: "url")])
}
