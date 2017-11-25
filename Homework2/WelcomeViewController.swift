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

    @IBOutlet weak var welcomeImage: UIImageView!
    
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
        
        self.welcomeImage.alpha = 0.0
        welcomeMessageLabel.text = "Welcome \(username!), your account has been created!"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, animations: {
            self.welcomeImage.alpha = 1.0
        }, completion: nil)
    }
    
}
