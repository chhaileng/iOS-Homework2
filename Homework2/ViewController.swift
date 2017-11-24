//
//  ViewController.swift
//  Homework2
//
//  Created by Chhaileng Peng on 11/21/17.
//  Copyright © 2017 Chhaileng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        phoneTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        
        usernameTextField.tag = 0
        passwordTextField.tag = 1
        phoneTextField.tag = 2
        emailTextField.tag = 3

        phoneTextField.addTarget(self, action: #selector(formatPhoneTextField), for: UIControlEvents.editingChanged)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag != 2 {
            if phoneTextField.text?.count == 0 {
                phoneTextField.leftView = nil
                phoneTextField.placeholder = "(+855) 012-345-6780"
            }
        }
        
        if textField.tag == 2 {
            let countryCode = UITextField(frame: CGRect(x: 0, y: 0, width: 77, height: 30))
            countryCode.text = " (+855)"
            countryCode.isUserInteractionEnabled = false
            countryCode.font = UIFont.systemFont(ofSize: 23)
            textField.leftViewMode = UITextFieldViewMode.always
            textField.leftView = countryCode
            textField.placeholder = "012-345-6780"
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 2 {
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= 12
        }
        return true
    }
    
    @objc func formatPhoneTextField() {
        phoneTextField.text = formatPhone(phoneTextField.text!)
    }
    
    @IBAction func backToSignUp(_ sender: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
        phoneTextField.text = nil
        phoneTextField.leftView = nil
        phoneTextField.placeholder = "(+855) 012-345-6780"
        emailTextField.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWelcome" {
            let welcome = segue.destination as! WelcomeViewController
            welcome.username = usernameTextField.text!
            welcome.phone = phoneTextField.text!
            welcome.email = emailTextField.text!
        }
    }
    
    private func formatPhone(_ number: String) -> String {
        let cleanNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let format: [Character] = ["X", "X", "X", "-", "X", "X", "X", "-", "X", "X", "X", "X"]
        
        var result = ""
        var index = cleanNumber.startIndex
        for ch in format {
            if index == cleanNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanNumber[index])
                index = cleanNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
}

