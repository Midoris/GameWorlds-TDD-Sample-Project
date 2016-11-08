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

    func testDidFinishParsingNotification_PushesWorldsListVC() {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        UIApplication.shared.keyWindow?.rootViewController = mockNavigationController
        _ = sut.view
        let notificationName = Notification.Name("DidFinishParsing")
        NotificationCenter.default.post(name: notificationName, object: self)
        XCTAssertTrue(mockNavigationController.pushedViewController is WorldsListViewController)
    }

    func testAfterWorldsListVCPushed_ItHasTheSameWorldsManagerAsSutHas() {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        UIApplication.shared.keyWindow?.rootViewController = mockNavigationController
        _ = sut.view
        let notificationName = Notification.Name("DidFinishParsing")
        NotificationCenter.default.post(name: notificationName, object: self)
        guard let worldsListViewController = mockNavigationController.pushedViewController as? WorldsListViewController else {
            fatalError()
        }
        guard let worldsListWorldsManager = worldsListViewController.worldsManager else {
            fatalError()
        }
        XCTAssertTrue(worldsListWorldsManager === sut.worldsManager)
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

    class MockNavigationController: UINavigationController {

        var pushedViewController: UIViewController?

        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
