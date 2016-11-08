//
//  WorldsManagerTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldsManagerTests: XCTestCase {

    var sut: WorldsManager!
    
    override func setUp() {
        super.setUp()
        sut = WorldsManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWorldsCount_InitiallyShouldBeZero() {
        XCTAssertEqual(sut.worldsCount, 0, "Initially Should Be Zero")
    }

    func testWorldsCount_AfterAddingOneWorld_IsOne() {
        sut.add(world: World(name: "The name"))
        XCTAssertEqual(sut.worldsCount, 1)
    }

    func testWorldAtIndex_ShouldReturnPreviouslyAddedWorld() {
        let world = World(name: "The name")
        sut.add(world: world)
        let returnedWorld = sut.world(at: 0)
        XCTAssertEqual(world.name, returnedWorld.name)
    }

    func testRemoveAllWorlds_ShouldResultInContBeZero() {
        sut.add(world: World(name: "The name"))
        XCTAssertEqual(sut.worldsCount, 1)
        sut.removeAllWorlds()
        XCTAssertEqual(sut.worldsCount, 0)
    }

    func testPrase_ChangeWorldsCount() {
        XCTAssertEqual(sut.worldsCount, 0)
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDict as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.worldsCount, 3)
    }

    func testParse_ShouldReverseParsedWorlds() {
        var notReversedWorlds = [World]()
        let firstWorld = World(name: "USA 12 (recommended)", country: "US", language: "en",  worldStatus: WorldStatus(description: "online", id: "3"))
        notReversedWorlds.append(firstWorld)
        let secondWorld = World(name: "Battle World 3 (recommended)", country: "XB", language: "xb",  worldStatus: WorldStatus(description: "online", id: "3"))
        notReversedWorlds.append(secondWorld)
        let theThirdWorld = World(name: "Europe 1", country: "XB", language: "xb",  worldStatus: WorldStatus(description: "online", id: "3"))
        notReversedWorlds.append(theThirdWorld)
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDict as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(notReversedWorlds[0], sut.world(at: 2))
    }

    func testParse_ResultsInExpectedWorld() {
        let expectedWorld = World(name: "Europe 1", country: "XB", language: "xb",  worldStatus: WorldStatus(description: "online", id: "3"))
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDict as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.world(at: 0), expectedWorld)
    }

    func testParse_SendsNotification() {
        expectation(forNotification: "DidFinishParsing", object: nil, handler: nil)
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDict as [[String : AnyObject]]?, error: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testFetchWorlds_CallsLoginUser() {
        let mockAPIClient = MockAPIClient()
        sut.fetchWorlds(with: "ios.test@xyrality.com", and: "password", apiClient: mockAPIClient)
        XCTAssertTrue(mockAPIClient.loginUserGotCalled)
    }

    func testParseWorldsDictWithWrongLanguageKey_DoesntChangeWorldsCount() {
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDictWithWrongLanguage as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.worldsCount, 0)
    }

    func testParseWorldsDictWithWrongWorldStatusiDKey_DoesntChangeWorldsCount() {
        sut.parse(worldsDict: ExamplesOfWorldsDicts.WorldsDictWithWrongWorldStatusId as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.worldsCount, 0)
    }

    func testCallParseWithNil_DoesntChangeWorldsCount() {
        sut.parse(worldsDict: nil, error: nil)
        XCTAssertEqual(sut.worldsCount, 0)
    }

}

extension WorldsManagerTests {

    class MockAPIClient: APIClient {
        var loginUserGotCalled = false

        override func loginUser(with username: String, password: String, deviceType: String, deviceId: String, completion: @escaping ([[String : AnyObject]]?, Error?) -> Void) {
            loginUserGotCalled = true
        }
    }
}

