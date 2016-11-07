//
//  WorldsListViewController.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import UIKit

class WorldsListViewController: UIViewController {

    @IBOutlet weak var worldsTableView: UITableView!
    var worldsListDataProvider: WorldsListDataProvider!
    var worldsManager: WorldsManager?


    override func viewDidLoad() {
        worldsTableView.dataSource = worldsListDataProvider
        worldsTableView.delegate = worldsListDataProvider
        worldsListDataProvider.worldsManager = self.worldsManager
        self.navigationItem.title = "Game Worlds"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        worldsTableView.reloadData()
    }


}
