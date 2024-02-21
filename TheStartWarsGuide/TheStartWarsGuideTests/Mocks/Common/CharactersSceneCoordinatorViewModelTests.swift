//
//  CharactersSceneCoordinatorViewModelTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

import XCTest
@testable import TheStartWarsGuide

final class CharactersSceneCoordinatorViewModelTests: XCTestCase {
    
    var sut: CharactersSceneCoordinatorViewModel!

    override func setUpWithError() throws {
        sut = CharactersSceneCoordinatorViewModel.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_push() {
        let characterMock = CharacterModel.mock
        let itemToPush = CharactersScenePushNavigationType.detail(character: .mock)
        sut.push(itemToPush)
        
        XCTAssertFalse(sut.navigationPath.isEmpty)
    }
    
    func test_pop() {
        let itemToPush = CharactersScenePushNavigationType.detail(character: .mock)
        sut.push(itemToPush)
        
        XCTAssertFalse(sut.navigationPath.isEmpty)
        sut.pop()
        XCTAssertTrue(sut.navigationPath.isEmpty)
    }
    
    func test_pop_to_root() {
        let rootItemToPush = CharactersScenePushNavigationType.list
        let itemToPush = CharactersScenePushNavigationType.detail(character: .mock)
        sut.push(rootItemToPush)
        sut.push(itemToPush)
        
        sut.popToRoot()
        XCTAssertTrue(sut.navigationPath.isEmpty)
    }
}
