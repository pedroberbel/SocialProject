//
//  LoginViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 06/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var closeAlert: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var forgetPassButton: UIButton!
    @IBOutlet weak var userLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    //Global Var
    var username = String()
    var password = String()
    var verifyResponse = [String: Any]()
    var responseString = String()
    var login = String()
    var activeUser = String()
    
    
    let userDefaults = Utilidades().getAuthenticatedUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activeUser = userDefaults
      
        if activeUser.isEmpty {
            print("Ninguem ativo: \(self.activeUser)")
        } else {
            print("Usuário Ativo: \(self.activeUser)")
            OperationQueue.main.addOperation {
        
            
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let authenticatedViewController = storyBoard.instantiateViewController(withIdentifier: "comTab") as! EnterViewController
                //pass username info to tabbarController
                self.present(authenticatedViewController, animated: true, completion: nil)
            }
        }

        
       self.alertLabel.isHidden = true
        self.closeAlert.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    // will close the yellow alert
    @IBAction func closeAlert(_ sender: Any) {
   self.yellowAlert(0, "")
        
    }
    var URLVerifyUser = "http://localhost/travelapp/login.php"
    
    
    func yellowAlert (_ status: Int, _ message: String){
        self.alertLabel.text = message
        //show alert
        if status == 1{
            print("chamou o alert")
        self.alertLabel.isHidden = false
        self.closeAlert.isHidden = false
        self.forgetPassButton.isHidden = true
        //hide alert
        } else {
        
        self.alertLabel.isHidden = true
        self.closeAlert.isHidden = true
        self.forgetPassButton.isHidden = false
            
        }
    }
    
     @IBAction func loginUser(_ sender: Any) {
        print ("clicou")
        if userLabel.text!.isEmpty || passwordLabel.text!.isEmpty {
        //show yellow alert
       self.yellowAlert(1, "Preencha todos os Campos")
        } else {
            self.yellowAlert(0, "")
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
//                        print(self.verifyResponse["status"]!)
                //transform back the value of "status" in string to do the comparison
                self.login = (self.verifyResponse["status"] as? String)!
                        print("status code: \(self.login)")
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    //if 'login' are equal to 200: login, else, show alert.
                    if (self.login == "200"){
                        //log in the app
                        OperationQueue.main.addOperation {
                            //change to the homeViewController trought EnterViewController
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let authenticatedViewController = storyBoard.instantiateViewController(withIdentifier: "comTab") as! EnterViewController
                            //pass username info to tabbarController
                            authenticatedViewController.information = self.username
                            self.activeUser = self.username
                            self.present(authenticatedViewController, animated: true, completion: nil)
 //USER DEFAULTS -
                            Utilidades().setAuthenticatedUser(username: self.username)
//                            self.userDefaults.set(self.username, forKey: "authenticatedUser")
                            
                        }
                        
                        

                    print("Login Válido!")
                } else {
                    //show the yellow alert
                        OperationQueue.main.addOperation {
                    self.yellowAlert(1, "Campos Inválidos")
                        }
                    print("Login Inválido!")
                    }
                }
            }
            task.resume()
        }//if the fields are not empty
        }// end button
    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "validLogin"{
//            let HomeVC = segue.destination as! HomeViewController
//            let verifiedUser = self.username
//            HomeVC.currentUser = verifiedUser
//        }
//    }
    
//    func getUserDefault() -> String {
////       var activeUser = self.userDefaults.object(forKey: "authenticatedUser")
//        print("enviando User: \(self.userDefaults.object(forKey: "authenticatedUser"))")
//        let active = self.userDefaults.object(forKey: "authenticatedUser") as? String
//        if active == nil {
//            return "400"
//        } else {
//        return self.userDefaults.object(forKey: "authenticatedUser") as! String
//        }
//    }
    
    
    
        }//end class

    

