//
//  WorldsListViewControllerTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldsListViewControllerTests: XCTestCase {

    var sut: WorldsListViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "WorldsListViewController") as! WorldsListViewController
        _ = sut.view
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.worldsTableView)
    }

    func testViewDIdLoad_ShouldSetWorldsTableViewDataSource() {
        XCTAssertNotNil(sut.worldsTableView.dataSource)
        XCTAssertTrue(sut.worldsTableView.dataSource is WorldsListDataProvider)
    }

    func testViewDIdLoad_ShouldSetWorldsTableViewDelegate() {
        XCTAssertNotNil(sut.worldsTableView.delegate)
        XCTAssertTrue(sut.worldsTableView.delegate is WorldsListDataProvider)
    }

    func testViewDIdLoad_ShouldSetDataSourceAndDelegateToTheSameObject() {
        XCTAssertEqual(sut.worldsTableView.delegate as? WorldsListDataProvider, sut.worldsTableView.dataSource as? WorldsListDataProvider)
    }

    
}
