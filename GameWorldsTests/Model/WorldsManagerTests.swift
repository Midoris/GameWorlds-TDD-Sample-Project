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
        sut.parse(worldsDict: worldsDict as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.worldsCount, 3)
    }

    func testParse_ResultsInExpectedWorld() {
        let expectedWorld = World(name: "Europe 1", country: "XB", language: "xb",  worldStatus: WorldStatus(description: "online", id: "3"))
        sut.parse(worldsDict: worldsDict as [[String : AnyObject]]?, error: nil)
        XCTAssertEqual(sut.world(at: 0).name, expectedWorld.name)
        XCTAssertEqual(sut.world(at: 0).country, expectedWorld.country)
        XCTAssertEqual(sut.world(at: 0).language, expectedWorld.language)
        XCTAssertEqual(sut.world(at: 0).worldStatus?.description, expectedWorld.worldStatus?.description)
        XCTAssertEqual(sut.world(at: 0).worldStatus?.id, expectedWorld.worldStatus?.id)
    }

    func testParse_SendsNotification() {
        expectation(forNotification: "DidFinishParsing", object: nil, handler: nil)
        sut.parse(worldsDict: worldsDict as [[String : AnyObject]]?, error: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }


    let worldsDict = [["name": "USA 12 (recommended)",
                       "worldStatus": ["description": "online", "id": "3",],
                       "id": "168", "mapURL": "https://maps3.lordsandknights.com/LKWorldServer-US-12", "language": "en", "url": "https://backend3.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-US-12.woa", "country": "US"],
                      ["name": "Battle World 3 (recommended)",
                       "worldStatus": ["description": "online", "id": "3",],
                       "id": "145", "mapURL": "https://maps1.lordsandknights.com/LKWorldServer-BattleWorld-World-3", "language": "xb", "url": "https://backend1.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-BattleWorld-World-3.woa", "country": "XB"],
                      ["name": "Europe 1",
                       "worldStatus": ["description": "online", "id": "3",],
                       "id": "128", "mapURL": "https://maps2.lordsandknights.com/LKWorldServer-Europe-1", "language": "xb", "url": "https://backend2.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-Europe-1.woa", "country": "XB"]
                      ]

}

