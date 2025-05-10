//
//  FetchAllCharactersUseCaseTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

import XCTest
@testable import TheStartWarsGuide

final class FetchAllCharactersUseCaseTests: XCTestCase {
    
    var sut: FetchAllCharactersUseCase!
    var repositoryMock: CharacterListRepositoryMock!

    override func setUpWithError() throws {
        repositoryMock = CharacterListRepositoryMock()
        sut = FetchAllCharactersUseCase(repository: repositoryMock, charactersPerPage: 10)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_execute_success_multiple_pages() async throws {
        let mock = CharacterListDTO.mock
        repositoryMock.dto = mock
        
        let result = try await sut.execute()
        let pages = mock.totalPages
        let totalCalls = mock.totalRecords / mock.totalPages
        let modelsCount = (totalCalls * mock.results.count)
        
        XCTAssertEqual(result.count, modelsCount)
    }
    
    func test_execute_success_single_page() async throws {
        let mock = CharacterListDTO(totalRecords: 10,
                                    totalPages: 1,
                                    results: [.init(uid: "1", name: "name", url: "characterUrl")])
        repositoryMock.dto = mock
        let result = try await sut.execute()
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0].name, mock.results[0].name)
    }
    
    func test_execute_empty() async throws {
        let mock = CharacterListDTO(totalRecords: 0,
                                    totalPages: 0,
                                    results: [])
        repositoryMock.dto = mock
        let result = try await sut.execute()
        
        XCTAssert(result.isEmpty)
    }
}
