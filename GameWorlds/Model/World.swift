//
//  World.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 06/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation


struct World: Equatable {

    let name: String
    let country: String?
    let language: String?
    let mapURL: String?
    let url: String?
    let id: String?
    let worldStatus: WorldStatus?

    init(name: String, country: String? = nil, language: String? = nil, mapURL: String? = nil, url: String? = nil, id: String? = nil, worldStatus: WorldStatus? = nil) {
        self.name = name
        self.country = country
        self.language = language
        self.mapURL = mapURL
        self.url = url
        self.id = id
        self.worldStatus = worldStatus
    }

}

func ==(lhs: World, rhs: World) -> Bool {
    if lhs.name != rhs.name {
        return false
    }
    if lhs.worldStatus != rhs.worldStatus {
        return false
    }
    if lhs.country != rhs.country {
        return false
    }
    if lhs.language != rhs.language {
        return false
    }
    if lhs.mapURL != rhs.mapURL {
        return false
    }
    if lhs.url != rhs.url {
        return false
    }
    if lhs.id != rhs.id {
        return false
    }
    return true
}
