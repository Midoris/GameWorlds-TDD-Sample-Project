//
//  DeviceInfoTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 08/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class DeviceInfoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDeviceInfo_ReturnsDeviceType() {
        let type = "\(UIDevice.current.model), \(UIDevice.current.systemName), \(UIDevice.current.systemVersion)"
        let result  = DeviceInfo.deviceInfo()
        XCTAssertEqual(type, result.0)
    }

}
