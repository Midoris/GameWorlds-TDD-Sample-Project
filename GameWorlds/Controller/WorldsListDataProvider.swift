//
//  WorldsListDataProvider.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import UIKit

class WorldsListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {

    var worldsManager: WorldsManager?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldsManager?.worldsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCell", for: indexPath) as! WorldCell
        guard let worldsManager = worldsManager else { fatalError() }
        let world = worldsManager.world(at: indexPath.row)
        cell.configCell(with: world)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
