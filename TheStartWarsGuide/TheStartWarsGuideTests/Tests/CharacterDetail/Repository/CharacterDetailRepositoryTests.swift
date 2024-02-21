//
//  CharacterDetailRepositoryTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

import XCTest
@testable import TheStartWarsGuide


final class CharacterDetailRepositoryTests: XCTestCase {
    
    var sut: CharacterDetailRepository!
    var networkingClientMock: NetworkClientMock!

    override func setUpWithError() throws {
        networkingClientMock = NetworkClientMock()
        sut = CharacterDetailRepository(networkingClient: networkingClientMock)
    }

    override func tearDownWithError() throws {
        networkingClientMock = nil
        sut = nil
    }

    func test_fetch_planet_information_success() async throws {
        let mock = PlanetModel.mock
        networkingClientMock.dto = mock
        let result = try await sut.fetchPlanetInformation(from: "planetUrl")
        
        XCTAssertEqual(result.name, mock.name)
        XCTAssertEqual(result.terrain, mock.terrain)
        XCTAssertEqual(result.climate, mock.climate)
        XCTAssertEqual(result.gravity, mock.gravity)
        XCTAssertEqual(result.population, mock.population)
    }
    
    func test_fetch_vehicle_success() async throws {
        let mock = VehicleModel.mock
        networkingClientMock.dto = mock
        let result = try await sut.fetchVehicle(from: "vehicleUrl")
        
        XCTAssertEqual(result.name, mock.name)
        XCTAssertEqual(result.model, mock.model)
        XCTAssertEqual(result.vehicleClass, mock.vehicleClass)
    }
    
    func test_fetch_film_success() async throws {
        let mock = FilmModel.mock
        networkingClientMock.dto = mock
        let result = try await sut.fetchFilm(from: "filmUrl")
        
        XCTAssertEqual(result.title, mock.title)
        XCTAssertEqual(result.releaseDate, mock.releaseDate)
        XCTAssertEqual(result.episodeId, mock.episodeId)
    }
}
