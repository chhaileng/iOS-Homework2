//
//  WelcomeViewController.swift
//  Homework2
//
//  Created by Chhaileng Peng on 11/22/17.
//  Copyright © 2017 Chhaileng. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var username: String?
    var phone: String?
    var email: String?

    var alertMsg: String {
        return "Username: \(String(describing: username!))\nPassword: *******\nPhone: \(String(describing: phone!))\nEmail: \(String(describing: email!))"
    }
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    @IBAction func showDetailButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Account Details", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageLabel.text = "Welcome \(username!), your account has been created!"
    }
    
}
