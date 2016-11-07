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

    func testWorkldsManager_IsNotNillAfterViewDidLoad() {
        XCTAssertNotNil(sut.worldsManager)
    }

    func testFetchGameWorlds_CallingWorldsManagerFetchWorldsMethod() {
        sut.loginTextField.text = "ios.test@xyrality.com"
        sut.passwordTextField.text = "password"
        let mockWorldsManager = MockWorldsManager()
        sut.worldsManager = mockWorldsManager
        sut.fetchGameWorlds()
        XCTAssertEqual(mockWorldsManager.login, "ios.test@xyrality.com")
        XCTAssertEqual(mockWorldsManager.password, "password")
    }

    func testFetchGameWorlds_ShouldNotCallWorldsManagerFetchWorldsMethodIfTextFieldsisNil() {
        let mockWorldsManager = MockWorldsManager()
        sut.worldsManager = mockWorldsManager
        sut.fetchGameWorlds()
        XCTAssertFalse(mockWorldsManager.fetchWorldsGotCalled)
    }
    
}

extension InputViewControllerTests {

    class MockWorldsManager: WorldsManager {

        var fetchWorldsGotCalled = false
        var login: String?
        var password: String?

        override func fetchWorlds(with login: String, and password: String) {
            self.login = login
            self.password = password
            fetchWorldsGotCalled = true
        }
    }
}
