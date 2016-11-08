//
//  WorldStatus.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 06/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation

struct WorldStatus: Equatable {

    let description: String
    let id: String
}

func ==(lhs: WorldStatus, rhs: WorldStatus) -> Bool {
    if lhs.description != rhs.description {
        return false
    }
    if lhs.id != rhs.id {
        return false
    }
    return true
}
