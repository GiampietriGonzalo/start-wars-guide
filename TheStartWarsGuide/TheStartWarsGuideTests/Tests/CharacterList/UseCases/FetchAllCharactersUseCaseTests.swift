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
        sut = FetchAllCharactersUseCase(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_execute_success_multiple_pages() async throws {
        let mock = CharacterListDTO.mock
        repositoryMock.dto = mock
        
        let result = try await sut.execute()
        let pages = mock.count / mock.results.count
        let modulo = mock.count % mock.results.count
        let totalCalls = modulo == .zero ? pages : pages + 1
        let modelsCount = (totalCalls * mock.results.count) + modulo
        
        XCTAssertEqual(result.count, modelsCount)
    }
    
    func test_execute_success_single_page() async throws {
        let mock = CharacterListDTO(count: 1, results: [.mock])
        repositoryMock.dto = mock
        let result = try await sut.execute()
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0].name, mock.results[0].name)
    }
    
    func test_execute_empty() async throws {
        let mock = CharacterListDTO(count: 0, results: [])
        repositoryMock.dto = mock
        let result = try await sut.execute()
        
        XCTAssert(result.isEmpty)
    }
}
