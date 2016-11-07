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
    @IBOutlet var worldsListDataProvider: UITableViewDataSource & UITableViewDelegate!


    override func viewDidLoad() {
        worldsTableView.dataSource = worldsListDataProvider
        worldsTableView.delegate = worldsListDataProvider
    }

}
