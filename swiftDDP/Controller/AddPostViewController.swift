//
//  AddPostViewController.swift
//  swiftDDP
//
//  Created by Zyad Galal on 6/19/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = "zyad"
        contentTextField.text = "hello i'm zyad galal"
    }
    

    @IBAction func addPostButtonClicked(_ sender: Any) {
        if AppDelegate.meteor?.connected == true{
                AppDelegate.meteor?.callMethodName("posts.methods.create", parameters: [["title":titleTextField.text!,"content":contentTextField.text!]], responseCallback: { (respose, error) in
                    if error != nil{
                        print(error!)
                    }
                    else{
                        print(respose!)
                    }
                })
        }
        else{
            print("not connected")
        }
    }
    
}
