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
}
