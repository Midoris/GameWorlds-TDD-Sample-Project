//
//  WorldsListDataProviderTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldsListDataProviderTests: XCTestCase {

    var sut: WorldsListDataProvider!
    var tableView: UITableView!
    var controller: WorldsListViewController!

    override func setUp() {
        super.setUp()
        sut = WorldsListDataProvider()
        sut.worldsManager = WorldsManager()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "WorldsListViewController") as! WorldsListViewController
        _ = controller.view

        tableView = controller.worldsTableView
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testNumberOfSections_IsOne() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }

    func testNumberOfRows_ShouldBeZeroIfWorldsManagerISNil() {
        sut.worldsManager = nil
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 0)
    }

    func testNumberOfRowsInSection_IsWorldsCont() {
        sut.worldsManager?.add(world: World(name: "First"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.worldsManager?.add(world: World(name: "Second"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func testCellForRow_ReturnsWorldCell() {
        sut.worldsManager?.add(world: World(name: "First"))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is WorldCell)
    }

    func testCellForRow_DequeuesCell() {
        let mockTableView = MockTableView.mockTableView(with: sut)
        sut.worldsManager?.add(world: World(name: "First"))
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }

    func testConfigCell_GetsCalledInCellForRow() {
        let mockTableView = MockTableView.mockTableView(with: sut)
        let world = World(name: "First")
        sut.worldsManager?.add(world: world)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockWorldCell
        XCTAssertEqual(cell.world?.name, world.name)
    }

}

extension WorldsListDataProviderTests {

    class MockTableView: UITableView {

        var cellGotDequeued = false

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }

        class func mockTableView(with dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockWorldCell.self, forCellReuseIdentifier: "WorldCell")
            return mockTableView
        }

    }

    class MockWorldCell: WorldCell {

        var world: World?

        override func configCell(with world: World) {
            self.world = world
        }

    }
}
