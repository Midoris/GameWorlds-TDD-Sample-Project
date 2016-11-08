//
//  DeviceInfo.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation
import UIKit

class DeviceInfo {

    class func deviceInfo() -> (String, String) {
        let type = "\(UIDevice.current.model), \(UIDevice.current.systemName), \(UIDevice.current.systemVersion)"
        let id = "\(UUID().uuidString)"
        return (type, id)
    }
    
}
