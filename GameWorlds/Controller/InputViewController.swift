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
        let notificationName = Notification.Name("DidFinishParsing")
        NotificationCenter.default.addObserver(self, selector: #selector(InputViewController.showWorlds), name: notificationName, object: nil)
    }

    @IBAction func fetchGameWorlds() {
        guard let login = loginTextField.text, login.characters.count > 0, let password = passwordTextField.text, password.characters.count > 0  else {
            return
        }
        worldsManager?.fetchWorlds(with: login, and: password)
    }

    func showWorlds() {
        print("DidFinishParsing resived")
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "WorldsListViewController") as? WorldsListViewController {
            nextViewController.worldsManager = self.worldsManager
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }
}
