//
//  MainViewController.swift
//  swiftDDP
//
//  Created by Zyad Galal on 6/19/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func postsButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func addNewPostButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddPostViewController") as! AddPostViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
