//
//  SignUpViewController.swift
//  swiftDDP
//
//  Created by Zyad Galal on 6/19/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "dev_zyad_galal@yahoo.com"
        passwordTextField.text = "Zyad Galal"
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        if AppDelegate.meteor?.connected == true{
            AppDelegate.meteor?.signup(withUserParameters: ["username":"nil","email":emailTextField.text!,"password":passwordTextField.text!,"profile":["firstName":"zyad","lastName":"galal","gender":"male","birthDate" : "15041998"]], responseCallback: { (response, error) in
                if error != nil{
                    print(error!)
                }
                else
                {
                    print(response!)
                }
            })
        }
        else{
            print("not connected")
        }
    }
}
