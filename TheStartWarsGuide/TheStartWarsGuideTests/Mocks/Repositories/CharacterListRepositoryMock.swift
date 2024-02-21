//
//  CharacterListRepositoryMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

@testable import TheStartWarsGuide

final class CharacterListRepositoryMock: CharacterListRepositoryProtocol {
    
    var dto: CharacterListDTO?
    var error: CustomError = .unknown
    
    func fetch(pageNumber: Int) async throws -> CharacterListDTO {
        guard let dto else { throw error }
        return dto
    }
}
