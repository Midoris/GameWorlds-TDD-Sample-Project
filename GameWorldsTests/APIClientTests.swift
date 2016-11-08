//
//  APIClientTests.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import XCTest
@testable import GameWorlds

class APIClientTests: XCTestCase {

    var sut: APIClient!
    var mockURLSession: MockURLSession!

    override func setUp() {
        super.setUp()
        sut = APIClient()
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLogin_MakesRequestWithUSerNameAndPassword() {
        sut.session = mockURLSession
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        XCTAssertNotNil(mockURLSession.completionHendler)
        guard mockURLSession.url != nil else {
            fatalError()
        }
        let allowedCharacters = CharacterSet(charactersIn: "/%=?$#+-~@<>|\\*,.()[]{}^!").inverted
        guard let expectedsername = "ios.test@xyrality.com".addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        guard let expectedPassword = "password".addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        let stringFromData = String(data: mockURLSession.requestData!, encoding: .utf8)
        XCTAssertEqual(stringFromData, "login=\(expectedsername)&password=\(expectedPassword)&deviceType=iPad&deviceId=randomId")
    }


    func testLogin_CallsResumeOfDataTask() {
        sut.session = mockURLSession
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        XCTAssertTrue(mockURLSession.dataTask.resumeGotCalled)
    }

    func testLogin_ThrowsErrorWhenDataIsInvalid() {
        var theError: Error?
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        let responseData = Data()
        mockURLSession.completionHendler?(responseData, nil, nil)
        XCTAssertNotNil(theError)
    }


    func  testLogin_ThrowsErrorWhenDataIsNill() {
        var theError: Error?
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        mockURLSession.completionHendler?(nil, nil, nil)
        XCTAssertNotNil(theError)
    }

    func testLogin_ThrowsErrorWhenResponseHesError() {
        var theError: Error?
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        let responseDict = ["token": "1234567890"]
        let responseData = try! JSONSerialization.data(withJSONObject: responseDict, options: [])
        let errorr = NSError(domain: "Some", code: 1234, userInfo: nil)
        mockURLSession.completionHendler?(responseData, nil, errorr)
        XCTAssertNotNil(theError)
    }

    func testLogin_ThrowsErrorWhenURLIsInvalid() {
        var theError: Error?
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in
            theError = error
        }
        sut.serverURL = ""
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        XCTAssertNotNil(theError)
    }


    func testWorkWithPlist_CallsCompletion() {
        var resultedWorlds: [[String: AnyObject]]?
        let completion = { (worlds: [[String: AnyObject]]?, error: Error?) in
            resultedWorlds = worlds
        }
        sut.work(with: ExamplesOfWorldsDicts.AllAvailableWorldsDict, completion: completion)
        XCTAssertNotNil(resultedWorlds)
    }

}

extension APIClientTests {

    class MockURLSession: GameWorldURLSession {

        typealias Handler = (Data?, URLResponse?, Error?)
            -> Void
        var completionHendler: Handler?
        var url: URL?
        var requestData: Data?
        var dataTask = MockURLSessionDataTask()


        func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
            self.url = request.url
            self.completionHendler = completionHandler
            requestData = request.httpBody
            return dataTask
        }

    }

    class MockURLSessionDataTask: URLSessionDataTask {
        var resumeGotCalled = false

        override func resume() {
            resumeGotCalled = true
        }
    }

}
