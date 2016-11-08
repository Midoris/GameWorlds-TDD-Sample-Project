//
//  WorldStatusTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 06/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldStatusTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetDescriptionAndId() {
        let worldStatus = WorldStatus(description: "The descroption", id: "The id")
        XCTAssertEqual(worldStatus.description, "The descroption")
        XCTAssertEqual(worldStatus.id, "The id")
    }

    func testEqualWorldStatuses_ShouldBeEqual() {
        let firstWorldStatus = WorldStatus(description: "The descritpion", id: "1")
        let secondWorldStatus = WorldStatus(description: "The descritpion", id: "1")
        XCTAssertEqual(firstWorldStatus, secondWorldStatus)
    }

    func testWhenDescriptionDeffers_ShouldBeNotEqual() {
        let firstWorldStatus = WorldStatus(description: "First descritpion", id: "1")
        let secondWorldStatus = WorldStatus(description: "Second descritpion", id: "1")
        XCTAssertNotEqual(firstWorldStatus, secondWorldStatus)
    }

    func testWhenIdDeffers_ShouldBeNotEqual() {
        let firstWorldStatus = WorldStatus(description: "The descritpion", id: "1")
        let secondWorldStatus = WorldStatus(description: "The descritpion", id: "2")
        XCTAssertNotEqual(firstWorldStatus, secondWorldStatus)
    }

}
