//
//  FetchPlanetInformationUseCaseTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

import XCTest
@testable import TheStartWarsGuide

final class FetchPlanetInformationUseCaseTests: XCTestCase {
    
    var sut: FetchPlanetInformationUseCase!
    var repositoryMock: CharacterDetailRepositoryMock!

    override func setUpWithError() throws {
        repositoryMock = CharacterDetailRepositoryMock()
        sut = FetchPlanetInformationUseCase(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_execute_success() async throws {
        let mock = PlanetDTO.mock
        repositoryMock.planetDTO = mock
        let result = try await sut.execute(with: "planetUrl")
        
        XCTAssertEqual(result.name, mock.result.properties.name)
        XCTAssertEqual(result.terrain, mock.result.properties.terrain)
        XCTAssertEqual(result.climate, mock.result.properties.climate)
        XCTAssertEqual(result.gravity, mock.result.properties.gravity)
        XCTAssertEqual(result.population, mock.result.properties.population)
    }
}
