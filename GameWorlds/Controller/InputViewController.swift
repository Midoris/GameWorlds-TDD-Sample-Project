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
    var actInd = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        worldsManager = WorldsManager()
        self.view.addSubview(self.actInd)
        let notificationName = Notification.Name("DidFinishParsing")
        NotificationCenter.default.addObserver(self, selector: #selector(InputViewController.showWorlds), name: notificationName, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func fetchGameWorlds() {
        guard let login = loginTextField.text, login.characters.count > 0, let password = passwordTextField.text, password.characters.count > 0  else {
            showAlert(message: "Please, enter login and password", controller: self)
            return
        }
        let apiClient = APIClient()
        worldsManager?.fetchWorlds(with: login, and: password, apiClient: apiClient)
        startAnimation()
    }

    func showWorlds() {
        if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "WorldsListViewController") as? WorldsListViewController {
            nextViewController.worldsManager = self.worldsManager
            self.hideAnimation()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }

    private func showAlert(message: String, controller: UIViewController){
        let alert = UIAlertController(title: "Error", message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }

    private func startAnimation() {
        self.view.alpha = 0.8
        self.navigationController?.navigationBar.alpha = 0.2
        let place = CGPoint(x: self.view.frame.size.width / 2, y: (self.view.frame.size.height / 2))
        self.actInd.center = place
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = .whiteLarge
        self.actInd.color = UIColor.black
        self.actInd.startAnimating()
        self.view.isUserInteractionEnabled = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    private func hideAnimation() {
        self.actInd.stopAnimating()
        self.view.alpha = 1
        self.navigationController?.navigationBar.alpha = 1
        self.view.isUserInteractionEnabled = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
