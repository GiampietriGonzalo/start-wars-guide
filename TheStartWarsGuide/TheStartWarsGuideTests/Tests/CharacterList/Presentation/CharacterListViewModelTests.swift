//
//  CharacterListViewModelTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

import XCTest
@testable import TheStartWarsGuide

final class CharacterListViewModelTests: XCTestCase {
    
    var sut: CharacterListViewModel!
    var repositoryMock: CharacterListRepositoryMock!
    
    override func setUpWithError() throws {
        repositoryMock = CharacterListRepositoryMock()
        let fetchAllCharactersUseCase = FetchAllCharactersUseCase(repository: repositoryMock)
        sut = CharacterListViewModel(fetchAllCharactersUseCase: fetchAllCharactersUseCase)
    }
    
    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }
    
    func test_loadContent() async {
        let characterMock = CharacterDTO.mock
        repositoryMock.dto = CharacterListDTO.mock
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.characters.isEmpty)
        XCTAssertEqual(sut.characters[0].name, characterMock.name)
        XCTAssertEqual(sut.characters[0].imageName, characterMock.name)
    }
    
    func test_loadContent_error_service() async {
        repositoryMock.error = .serviceError
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.characters.isEmpty)
    }
    
    func test_loadContent_error_decode() async {
        repositoryMock.error = .decodeError
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.characters.isEmpty)
    }
    
    func test_loadContent_error_invalid_url() async {
        repositoryMock.error = .invalidUrl
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.characters.isEmpty)
    }
    
    func test_loadContent_error_unknown() async {
        repositoryMock.error = .unknown
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.characters.isEmpty)
    }
    
}
