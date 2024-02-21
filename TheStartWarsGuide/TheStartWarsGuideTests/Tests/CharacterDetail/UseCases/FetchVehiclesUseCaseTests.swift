//
//  FetchVehiclesUseCaseTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

import XCTest
@testable import TheStartWarsGuide

final class FetchVehiclesUseCaseTests: XCTestCase {
    
    var sut: FetchVehiclesUseCase!
    var repositoryMock: CharacterDetailRepositoryMock!

    override func setUpWithError() throws {
        repositoryMock = CharacterDetailRepositoryMock()
        sut = FetchVehiclesUseCase(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_execute_success_multiple_results() async throws {
        let mock = VehicleModel.mock
        repositoryMock.vehicleModel = mock
        let results = try await sut.execute(with: ["vehicleUrl1", "vehicleUrl2"])
        
        XCTAssertEqual(results.count, 2)
        XCTAssertEqual(results[0].name, mock.name)
        XCTAssertEqual(results[0].model, mock.model)
        XCTAssertEqual(results[0].vehicleClass, mock.vehicleClass)
        XCTAssertEqual(results[1].name, mock.name)
        XCTAssertEqual(results[1].model, mock.model)
        XCTAssertEqual(results[1].vehicleClass, mock.vehicleClass)
    }
    
    func test_execute_success_single_result() async throws {
        let mock = VehicleModel.mock
        repositoryMock.vehicleModel = mock
        let results = try await sut.execute(with: ["vehicleUrl"])
        
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[0].name, mock.name)
        XCTAssertEqual(results[0].model, mock.model)
        XCTAssertEqual(results[0].vehicleClass, mock.vehicleClass)
    }
    
    func test_execute_success_empty_result() async throws {
        let mock = VehicleModel.mock
        repositoryMock.vehicleModel = mock
        let results = try await sut.execute(with: [])
        XCTAssertEqual(results.count, 0)
    }
    
    func test_execute_error() async {
        repositoryMock.error = .networkError
        do {
            _ = try await sut.execute(with: ["vehicleUrl"])
            XCTFail()
        } catch let error as CustomError {
            XCTAssertEqual(error, .networkError)
        } catch {
            XCTFail("The error should be a CustomError type")
        }
    }
}
