//
//  WorldsManager.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation

class WorldsManager {

    var worldsCount: Int { return worlds.count }
    private var worlds = [World]()

    func add(world: World) {
        worlds.append(world)
    }

    func world(at index: Int) -> World {
        return worlds[index]
    }

    func removeAllWorlds() {
        worlds.removeAll()
    }

    func fetchWorlds(with login: String, and password: String) {
        let apiClient = APIClient()
        let (deviceType, deviceId) = DeviceInfo.deviceInfo()
        apiClient.loginUser(with: login, password: password, deviceType: deviceType, deviceId: deviceId, completion: parse)
    }

    func parse(worldsDict: [[String: AnyObject]]?, error: Error?) {
        guard let worldsDict = worldsDict else { return }
        for world in worldsDict {
            guard let name = world["name"] as? String, let country = world["country"] as? String,  let language = world["language"] as? String else { return }
            guard let worldDescription = world["worldStatus"]?["description"] as? String, let worldId = world["worldStatus"]?["id"] as? String else { return }
            let worldStatus = WorldStatus(description: worldDescription, id: worldId)
            let world = World(name: name, country: country, language: language, worldStatus: worldStatus)
            worlds.append(world)
        }
    }


}
