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
        let mock = PlanetDTO.mock
        networkingClientMock.dto = mock
        let result = try await sut.fetchPlanetInformation(from: "planetUrl")
        
        XCTAssertEqual(result.result.properties.name, mock.result.properties.name)
        XCTAssertEqual(result.result.properties.terrain, mock.result.properties.terrain)
        XCTAssertEqual(result.result.properties.climate, mock.result.properties.climate)
        XCTAssertEqual(result.result.properties.gravity, mock.result.properties.gravity)
        XCTAssertEqual(result.result.properties.population, mock.result.properties.population)
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
