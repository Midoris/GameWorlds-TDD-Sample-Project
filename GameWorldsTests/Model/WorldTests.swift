//
//  WorldTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 06/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class WorldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldTakeName() {
        let world = World(name: "The name")
        XCTAssertEqual(world.name, "The name", "initializer should set world name")
    }

    func testInit_ShouldTakeNameAndCountry() {
        let world = World(name: "The name", country: "The Country")
        XCTAssertEqual(world.country, "The Country", "initializer should set world country")
    }

    func testInit_ShouldTakeNameAndCountryAndLanguage() {
        let world = World(name: "The name", country: "The Country", language: "The language")
        XCTAssertEqual(world.language, "The language")
    }

    func testInit_ShouldTakeNameAndCountryAndLanguageAndMapURL() {
        let world = World(name: "The name", country: "The Country", language: "The language", mapURL: "The map URL")
        XCTAssertEqual(world.mapURL, "The map URL")
    }

    func testInit_ShouldTakeNameAndCountryAndLanguageAndMapURLAndURL() {
        let world = World(name: "The name", country: "The Country", language: "The language", mapURL: "The map URL", url: "The url")
        XCTAssertEqual(world.url, "The url")
    }

    func testInit_ShouldTakeNameAndCountryAndLanguageAndMapURLAndURLAndId() {
        let world = World(name: "The name", country: "The Country", language: "The language", mapURL: "The map URL", url: "The url", id: "The id")
        XCTAssertEqual(world.id, "The id")
    }

    func testInit_ShouldTakeNameAndCountryAndLanguageAndMapURLAndURLAndIdAndWorldStatus() {
        let worldStatus = WorldStatus(description: "The description", id: "The id")
        let world = World(name: "The name", country: "The Country", language: "The language", mapURL: "The map URL", url: "The url", id: "The id", worldStatus: worldStatus)
        XCTAssertEqual(worldStatus.description, world.worldStatus?.description)
    }

    func testEqualWorlds_ShouldBeEqual() {
        let firstWorld = World(name: "First")
        let secondWorld = World(name: "First")
        XCTAssertEqual(firstWorld, secondWorld)
    }

    func testWhenNamesDiffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First")
        let secondWorld = World(name: "Second")
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testWhenWorldStatusDiffers_ShouldBeNotEqual() {
        let firstWorld = World(name: "First", worldStatus: WorldStatus(description: "First description", id: "1"))
        let secondWorld = World(name: "First", worldStatus: WorldStatus(description: "Second description", id: "1"))
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testWhenOneWorldStatusIsNilAndOtherIsnt_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", worldStatus: nil)
        let secondWorld = World(name: "First", worldStatus: WorldStatus(description: "Second description", id: "1"))
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testIfCountryDeffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", country: "RU", worldStatus: WorldStatus(description: "First description", id: "1"))
        let secondWorld = World(name: "First", country: "UA", worldStatus: WorldStatus(description: "First description", id: "1"))
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testIfLanguageDeffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", language: "A")
        let secondWorld = World(name: "First", language: "B")
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testIfMapURLDeffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", mapURL: "X")
        let secondWorld = World(name: "First", mapURL: "Y")
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testIfUrlDeffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", url: "X")
        let secondWorld = World(name: "First", url: "Y")
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

    func testIfDdDeffers_ShouldNotBeEqual() {
        let firstWorld = World(name: "First", id: "1")
        let secondWorld = World(name: "First", id: "2")
        XCTAssertNotEqual(firstWorld, secondWorld)
    }

}
