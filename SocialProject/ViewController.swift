//
//  RegisterViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 21/02/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Register_click(_ sender: Any) {
        if userTxt.text!.isEmpty {
            //Red placeholder
            userTxt.attributedPlaceholder=NSAttributedString(string:"Usuário", attributes: [NSForegroundColorAttributeName:UIColor.red])
        }
    
    }

}

