//
//  APIClient.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation

class APIClient {

    lazy var session: GameWorldURLSession = URLSession.shared

    func loginUser(with username: String, password: String, deviceType: String, deviceId: String, completion: @escaping ([[String: AnyObject]]?, Error?) -> Void) {
        let allowedCharacters = CharacterSet(charactersIn: "/%=?$#+-~@<>|\\*,.()[]{}^!").inverted
        guard let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        guard let encodedPassword = password.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        guard let url = URL(string: "https://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds") else {
            fatalError()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let postString = "login=\(encodedUsername)&password=\(encodedPassword)&deviceType=\(deviceType)&deviceId=\(deviceId)"
        request.httpBody = postString.data(using: .utf8)
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil, WebServiceError.responseError)
                return
            }
            if let theData = data {
                do {
                    let plistObject = try PropertyListSerialization.propertyList(from: theData, options: PropertyListSerialization.ReadOptions(rawValue: UInt(0)),format: nil)
                    if let responseDict = plistObject as? [String: AnyObject] {
                        if let worldsDict = responseDict["allAvailableWorlds"] as? [[String: AnyObject]] {
                            completion(worldsDict, error)
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, WebServiceError.dataEmptyError)
            }
        }
        task.resume()
    }

}

enum WebServiceError: Error {
    case dataEmptyError
    case responseError
}

protocol GameWorldURLSession {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask

}

extension URLSession: GameWorldURLSession {
}
