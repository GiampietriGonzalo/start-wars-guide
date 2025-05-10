//
//  CharacterListRepositoryMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

@testable import TheStartWarsGuide

final class CharacterListRepositoryMock: CharacterListRepositoryProtocol {
    
    var dto: CharacterListDTO?
    var error: CustomError = .unknown
    
    func fetch(pageNumber: Int, limit: Int) async throws -> CharacterListDTO {
        guard let dto else { throw error }
        return dto
    }
}
