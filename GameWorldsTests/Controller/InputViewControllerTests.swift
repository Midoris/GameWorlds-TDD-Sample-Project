//
//  InputViewControllerTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class InputViewControllerTests: XCTestCase {

    var sut: InputViewController!
    
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_HasLoginTextField() {
        XCTAssertNotNil(sut.loginTextField)
    }

    func test_HasPasswordTextField() {
        XCTAssertNotNil(sut.passwordTextField)
    }

    func test_HasGetWorldsButton() {
        XCTAssertNotNil(sut.getWorldsButton)
    }

}
