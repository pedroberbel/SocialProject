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
// if theres a empty field, it placeholder turn in Red color.
        if userTxt.text!.isEmpty || passTxt.text!.isEmpty || emailTxt.text!.isEmpty || firstNameTxt.text!.isEmpty || lastNameTxt.text!.isEmpty{
            //Red placeholder
            userTxt.attributedPlaceholder=NSAttributedString(string:"Usuário", attributes: [NSForegroundColorAttributeName:UIColor.red])
            passTxt.attributedPlaceholder=NSAttributedString(string:"Senha", attributes: [NSForegroundColorAttributeName:UIColor.red])
            emailTxt.attributedPlaceholder=NSAttributedString(string:"E-mail", attributes:[NSForegroundColorAttributeName:UIColor.red])
            firstNameTxt.attributedPlaceholder=NSAttributedString(string:"Primeiro Nome", attributes: [NSForegroundColorAttributeName:UIColor.red])
            lastNameTxt.attributedPlaceholder=NSAttributedString(string:"Último Nome", attributes:[NSForegroundColorAttributeName:UIColor.red])
            
        } else {
            // send to DB
        }
    
    }

}

