//
//  FetchFilmsUseCaseTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
//

import XCTest
@testable import TheStartWarsGuide

final class FetchFilmsUseCaseTests: XCTestCase {
    
    var sut: FetchFilmsUseCase!
    var repositoryMock: CharacterDetailRepositoryMock!

    override func setUpWithError() throws {
        repositoryMock = CharacterDetailRepositoryMock()
        sut = FetchFilmsUseCase(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        repositoryMock = nil
        sut = nil
    }

    func test_execute_success_multiple_results() async throws {
        let mock = FilmModel.mock
        repositoryMock.filmModel = mock
        let results = try await sut.execute(with: ["filmUrl1", "filmUrl2"])
        
        XCTAssertEqual(results.count, 2)
        XCTAssertEqual(results[0].title, mock.title)
        XCTAssertEqual(results[0].releaseDate, mock.releaseDate)
        XCTAssertEqual(results[0].episodeId, mock.episodeId)
        XCTAssertEqual(results[1].title, mock.title)
        XCTAssertEqual(results[1].releaseDate, mock.releaseDate)
        XCTAssertEqual(results[1].episodeId, mock.episodeId)
    }
    
    func test_execute_success_single_result() async throws {
        let mock = FilmModel.mock
        repositoryMock.filmModel = mock
        let results = try await sut.execute(with: ["filmUrl"])
        
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[0].title, mock.title)
        XCTAssertEqual(results[0].releaseDate, mock.releaseDate)
        XCTAssertEqual(results[0].episodeId, mock.episodeId)
    }
    
    func test_execute_success_empty_result() async throws {
        let mock = FilmModel.mock
        repositoryMock.filmModel = mock
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
