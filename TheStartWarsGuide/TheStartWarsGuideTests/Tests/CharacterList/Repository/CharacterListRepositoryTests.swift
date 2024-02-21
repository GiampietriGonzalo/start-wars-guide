//
//  CharacterListRepositoryTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 19/02/2024.
//

import XCTest
@testable import TheStartWarsGuide

final class CharacterListRepositoryTests: XCTestCase {
    
    var sut: CharacterListRepository!
    var networkingClientMock: NetworkClientMock!

    override func setUpWithError() throws {
        networkingClientMock = NetworkClientMock()
        sut = CharacterListRepository(networkingClient: networkingClientMock)
    }

    override func tearDownWithError() throws {
        networkingClientMock = nil
        sut = nil
    }

    
    func test_fetch_success() async throws {
        let mock = CharacterListDTO.mock
        networkingClientMock.dto = mock
        let result = try await sut.fetch()

        XCTAssertEqual(result.count, mock.count)
        XCTAssertEqual(result.results.count, mock.results.count)
        if result.results.count == mock.results.count {
            for i in 0..<result.results.count {
                XCTAssertEqual(result.results[i].name, mock.results[i].name)
            }
        }
    }
    
    func test_fetch_failure_network() async {
        var result: CharacterListDTO?
        networkingClientMock.error = .networkError

        do {
            result = try await sut.fetch()
        } catch let error as CustomError {
            XCTAssertNil(result)
            XCTAssertEqual(error, networkingClientMock.error)
        } catch {
            XCTFail("The error should be a CustomError type")
        }
    }
}
