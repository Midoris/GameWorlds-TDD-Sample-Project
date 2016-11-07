//
//  InputViewController.swift
//  GameWorlds
//
//  Created by Ievgenii Iablonskyi on 07/11/2016.
//  Copyright © 2016 Ievgenii Iablonskyi. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var getWorldsButton: UIButton!
    var worldsManager: WorldsManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        worldsManager = WorldsManager()
    }

    @IBAction func fetchGameWorlds() {
        guard let login = loginTextField.text, login.characters.count > 0, let password = passwordTextField.text, password.characters.count > 0  else {
            return
        }
        worldsManager?.fetchWorlds(with: login, and: password)
    }
}
