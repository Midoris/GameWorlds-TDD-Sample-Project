//
//  ExamplesOfWorldsDicts.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 08/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import Foundation

struct ExamplesOfWorldsDicts {

    static let AllAvailableWorldsDict = ["allAvailableWorlds": [["name": "USA 12 (recommended)",
                                                                 "worldStatus": ["description": "online", "id": "3",],
                                                                 "id": "168", "mapURL": "https://maps3.lordsandknights.com/LKWorldServer-US-12", "language": "en", "url": "https://backend3.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-US-12.woa", "country": "US"],
                                                                ["name": "Battle World 3 (recommended)",
                                                                 "worldStatus": ["description": "online", "id": "3",],
                                                                 "id": "145", "mapURL": "https://maps1.lordsandknights.com/LKWorldServer-BattleWorld-World-3", "language": "xb", "url": "https://backend1.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-BattleWorld-World-3.woa", "country": "XB"],
                                                                ["name": "Europe 1",
                                                                 "worldStatus": ["description": "online", "id": "3",],
                                                                 "id": "128", "mapURL": "https://maps2.lordsandknights.com/LKWorldServer-Europe-1", "language": "xb", "url": "https://backend2.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-Europe-1.woa", "country": "XB"]
        ]
    ]

    static let WorldsDict = [["name": "USA 12 (recommended)",
                              "worldStatus": ["description": "online", "id": "3",],
                              "id": "168", "mapURL": "https://maps3.lordsandknights.com/LKWorldServer-US-12", "language": "en", "url": "https://backend3.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-US-12.woa", "country": "US"],
                             ["name": "Battle World 3 (recommended)",
                              "worldStatus": ["description": "online", "id": "3",],
                              "id": "145", "mapURL": "https://maps1.lordsandknights.com/LKWorldServer-BattleWorld-World-3", "language": "xb", "url": "https://backend1.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-BattleWorld-World-3.woa", "country": "XB"],
                             ["name": "Europe 1",
                              "worldStatus": ["description": "online", "id": "3",],
                              "id": "128", "mapURL": "https://maps2.lordsandknights.com/LKWorldServer-Europe-1", "language": "xb", "url": "https://backend2.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-Europe-1.woa", "country": "XB"]]

    static let WorldsDictWithWrongLanguage = [["name": "USA 12 (recommended)",
                                               "worldStatus": ["description": "online", "id": "3",],
                                               "id": "168", "mapURL": "https://maps3.lordsandknights.com/LKWorldServer-US-12", "Xlanguage": "en", "url": "https://backend3.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-US-12.woa", "country": "US"]]

    static let WorldsDictWithWrongWorldStatusId = [["name": "USA 12 (recommended)",
                                                    "worldStatus": ["description": "online", "Sid": "3",],
                                                    "id": "168", "mapURL": "https://maps3.lordsandknights.com/LKWorldServer-US-12", "language": "en", "url": "https://backend3.lordsandknights.com/XYRALITY/WebObjects/LKWorldServer-US-12.woa", "country": "US"]]
    
    
}
