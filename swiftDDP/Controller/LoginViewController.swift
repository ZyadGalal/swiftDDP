//
//  LoginViewController.swift
//  swiftDDP
//
//  Created by Zyad Galal on 6/19/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "elrayes@blndin.com"
        passwordTextField.text = "hmadahelal123"
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if AppDelegate.meteor?.connected == true{

            AppDelegate.meteor?.logon(withEmail: emailTextField.text!, password: passwordTextField.text!, responseCallback: { (response, error) in
                if error != nil{
                    print(error!)
                }
                else{
                    print(response!)
                }
            })
        }
        else{
            print("not connected")
        }
    }
    
}
