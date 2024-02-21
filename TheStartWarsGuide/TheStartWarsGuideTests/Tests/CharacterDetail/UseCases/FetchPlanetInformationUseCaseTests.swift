//
//  FetchPlanetInformationUseCaseTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
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
        let mock = PlanetModel.mock
        repositoryMock.planetModel = mock
        let result = try await sut.execute(with: "planetUrl")
        
        XCTAssertEqual(result.name, mock.name)
        XCTAssertEqual(result.terrain, mock.terrain)
        XCTAssertEqual(result.climate, mock.climate)
        XCTAssertEqual(result.gravity, mock.gravity)
        XCTAssertEqual(result.population, mock.population)
    }
}
