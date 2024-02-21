//
//  CharacterDetailViewModelTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

import XCTest
@testable import TheStartWarsGuide

final class CharacterDetailViewModelTests: XCTestCase {
    
    var sut: CharacterDetailViewModel!
    var repositoryMock: CharacterDetailRepositoryMock!

    override func setUpWithError() throws {
        repositoryMock = CharacterDetailRepositoryMock()
        let fetchPlanetInformationUseCase = FetchPlanetInformationUseCase(repository: repositoryMock)
        let fetchVehiclesUseCase = FetchVehiclesUseCase(repository: repositoryMock)
        let fetchFilmsUseCase = FetchFilmsUseCase(repository: repositoryMock)
        
        sut = CharacterDetailViewModel(characterModel: .mock,
                                       fetchPlanetInformationUseCase: fetchPlanetInformationUseCase,
                                       fetchVehiclesUseCase: fetchVehiclesUseCase,
                                       fetchFilmsUseCase: fetchFilmsUseCase)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_loadContent() async {
        let characterMock = CharacterModel.mock
        repositoryMock.planetModel = .mock
        repositoryMock.vehicleModel = .mock
        repositoryMock.filmModel = .mock
        sut.characterModel = characterMock
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.viewData.characterName, characterMock.name)
        XCTAssertEqual(sut.viewData.title, characterMock.name)
        XCTAssertFalse(sut.viewData.carrouselSections.isEmpty)
        XCTAssertFalse(sut.viewData.listSections.isEmpty)
    }
    
    func test_loadContent_error_service() async {
        repositoryMock.error = .serviceError
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.viewData.carrouselSections.isEmpty)
        XCTAssertTrue(sut.viewData.listSections.isEmpty)
    }
    
    func test_loadContent_error_decode() async {
        repositoryMock.error = .decodeError
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.viewData.carrouselSections.isEmpty)
        XCTAssertTrue(sut.viewData.listSections.isEmpty)
    }
    
    func test_loadContent_error_invalid_url() async {
        repositoryMock.error = .invalidUrl
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.viewData.carrouselSections.isEmpty)
        XCTAssertTrue(sut.viewData.listSections.isEmpty)
    }
    
    func test_loadContent_error_unknown() async {
        repositoryMock.error = .unknown
        await sut.loadContent()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.viewData.carrouselSections.isEmpty)
        XCTAssertTrue(sut.viewData.listSections.isEmpty)
    }

}
