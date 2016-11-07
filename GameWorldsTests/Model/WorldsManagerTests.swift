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
    

}
