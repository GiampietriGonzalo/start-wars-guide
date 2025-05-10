//
//  CharactersSceneCoordinatorViewModelTests.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
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
        let itemToPush = CharactersScenePushNavigationType.detail(characterUrl: "characterUrl")
        sut.push(itemToPush)
        
        XCTAssertFalse(sut.navigationPath.isEmpty)
    }
    
    func test_pop() {
        let itemToPush = CharactersScenePushNavigationType.detail(characterUrl: "characterUrl")
        sut.push(itemToPush)
        
        XCTAssertFalse(sut.navigationPath.isEmpty)
        sut.pop()
        XCTAssertTrue(sut.navigationPath.isEmpty)
    }
    
    func test_pop_to_root() {
        let rootItemToPush = CharactersScenePushNavigationType.list
        let itemToPush = CharactersScenePushNavigationType.detail(characterUrl: "characterUrl")
        sut.push(rootItemToPush)
        sut.push(itemToPush)
        
        sut.popToRoot()
        XCTAssertTrue(sut.navigationPath.isEmpty)
    }
}
