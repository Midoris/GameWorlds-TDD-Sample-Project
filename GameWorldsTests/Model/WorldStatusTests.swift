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

}
