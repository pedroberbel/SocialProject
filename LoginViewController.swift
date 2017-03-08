//
//  LoginViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 06/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    //Global Var
    var username = String()
    var password = String()
    var verifyResponse = [String: Any]()
    var responseString = String()
    var login = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    var URLVerifyUser = "http://localhost/travelapp/login.php"
    
     @IBAction func loginUser(_ sender: Any) {
        if userLabel.text!.isEmpty || passwordLabel.text!.isEmpty {
         //alert
            
        } else {
            //set G.V. with the input values by the user
            self.username = userLabel.text!.lowercased()
            self.password = passwordLabel.text!
            
           //send the data to login.php
            let url = NSURL(string: self.URLVerifyUser)!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
        
            let body = "username=\(self.username)&password=\(self.password)"
            request.httpBody = body.data(using:String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response, error in
                
                if error != nil {
                    print("error: \(error)")
                    return
                }
                self.responseString = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String)
//                print("responseString:\(self.responseString)")
                
               //transform the responseString of type String to dictionary
                if let data = self.responseString.data(using: String.Encoding.utf8){
                    do{
                        self.verifyResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        print(self.verifyResponse["status"]!)
                //transform back the value of "status" in string to do the comparison
                self.login = (self.verifyResponse["status"] as? String)!
                        print("sucesso: \(self.login)")
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    //if 'login' are equal to 200: login, else, show alert.
                    if (self.login == "200"){
                        print("Login Válido!")
                    } else {
                        print("Login Inválido!")
                    }
                }
            
            }
            task.resume()
        }
 
            
        }// end button
        }//end class

    

