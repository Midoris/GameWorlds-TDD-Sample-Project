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

    func testLogin_CallsResumeOfDataTask() {
        sut.session = mockURLSession
        let completion = { (error: Error?) in }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        XCTAssertTrue(mockURLSession.dataTask.resumeGotCalled)
    }

    func testLogin_ThrowsErrorWhenJSONIsInvalid() {
        var theError: Error?
        let completion = { (error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        let responseData = Data()
        mockURLSession.completionHendler?(responseData, nil, nil)
        XCTAssertNotNil(theError)
    }

    func  testLogin_ThrowsErrorWhenDataIsNill() {
        var theError: Error?
        let completion = { (error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        mockURLSession.completionHendler?(nil, nil, nil)
        XCTAssertNotNil(theError)
    }

    func testLogin_ThrowsErrorWhenResponseHesError() {
        var theError: Error?
        let completion = { (error: Error?) in
            theError = error
        }
        sut.loginUser(with: "ios.test@xyrality.com", password: "password", deviceType: "iPad", deviceId: "randomId", completion: completion)
        let responseDict = ["token": "1234567890"]
        let responseData = try! JSONSerialization.data(withJSONObject: responseDict, options: [])
        let errorr = NSError(domain: "Some", code: 1234, userInfo: nil)
        mockURLSession.completionHendler?(responseData, nil, errorr)
        XCTAssertNotNil(theError)
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
