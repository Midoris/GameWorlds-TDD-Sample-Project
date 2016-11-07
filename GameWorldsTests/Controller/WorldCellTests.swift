//
//  WorldCellTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSUT_HasNameLabel() {
        let cell = dequeuedItemCell(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell.nameLabel)
    }

    func testSUT_HasDescriptionLabel() {
        let cell = dequeuedItemCell(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell.descriptionLabel)
    }

    func testSUT_HasLanguageLabel() {
        let cell = dequeuedItemCell(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell.languageLabel)
    }

    func testSUT_HasCountryLabel() {
        let cell = dequeuedItemCell(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell.countryLabel)
    }

    func testConfigWithWorld_SetsLabelTexts() {
        let cell = dequeuedItemCell(for: IndexPath(row: 0, section: 0))
        cell.configCell(with: World(name: "First", country: "RU", language: "ru", mapURL: nil, url: nil, id: nil, worldStatus: WorldStatus(description: "online", id: "3")))
        XCTAssertEqual(cell.nameLabel.text, "First")
        XCTAssertEqual(cell.countryLabel.text, "RU")
        XCTAssertEqual(cell.languageLabel.text, "ru")
        XCTAssertEqual(cell.descriptionLabel.text, "online")
    }

    func dequeuedItemCell(for indexPath: IndexPath) -> WorldCell {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WorldsListViewController") as! WorldsListViewController
        _ = controller.view
        let tableView = controller.worldsTableView
        let dataProvider = FakeDataSource()
        tableView?.dataSource = dataProvider
        let cell = tableView?.dequeueReusableCell(withIdentifier: "WorldCell", for: IndexPath(row: 0, section: 0)) as! WorldCell

        return cell
    }


}

extension WorldCellTests {

    class FakeDataSource: NSObject, UITableViewDataSource {


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }


        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
