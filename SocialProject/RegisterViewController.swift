//
//  RegisterViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 21/02/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var closeAlert: UIButton!
    @IBOutlet weak var alertLabel: UITextField!
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    
    var username = String()
    var password = String()
    var email = String()
    var firstName = String()
    var lastName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertLabel.isHidden = true
        closeAlert.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        if userTxt.isEnabled {
            alertLabel.isHidden = true
            closeAlert.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userTxt.isEditing {
            alertLabel.isHidden = true
            closeAlert.isHidden = true
        }
    }
    @IBAction func closeAlert(_ sender: Any) {
        alertLabel.isHidden = true
        closeAlert.isHidden = true
    
    }
    
    var URLRegisterUser = "http://localhost/travelapp/register.php"
    var URLRegisterUser2 = String()
    
    @IBAction func Register_click(_ sender: Any) {

// if theres a empty field, it placeholder turn in Red color.
        if userTxt.text!.isEmpty || passTxt.text!.isEmpty || emailTxt.text!.isEmpty || firstNameTxt.text!.isEmpty || lastNameTxt.text!.isEmpty{
            alertLabel.isHidden = false
            alertLabel.text = "Preencha todos os campos."
            closeAlert.isHidden = false
            //Red placeholder
            userTxt.attributedPlaceholder=NSAttributedString(string:"Usuário", attributes: [NSForegroundColorAttributeName:UIColor.red])
            passTxt.attributedPlaceholder=NSAttributedString(string:"Senha", attributes: [NSForegroundColorAttributeName:UIColor.red])
            emailTxt.attributedPlaceholder=NSAttributedString(string:"E-mail", attributes:[NSForegroundColorAttributeName:UIColor.red])
            firstNameTxt.attributedPlaceholder=NSAttributedString(string:"Primeiro Nome", attributes: [NSForegroundColorAttributeName:UIColor.red])
            lastNameTxt.attributedPlaceholder=NSAttributedString(string:"Último Nome", attributes:[NSForegroundColorAttributeName:UIColor.red])
        
        //if text is entered
        } else {
        //create new user in MySQL
            //url to php file
        self.username = userTxt.text!.lowercased()
        self.password = passTxt.text!
        self.email = emailTxt.text!
        self.firstName = firstNameTxt.text!
        self.lastName = lastNameTxt.text!
        
        self.URLRegisterUser2 = "http://localhost/travelapp/register.php?username=\(self.username)&password=\(self.password)&email=\(self.email)&fullname=\(self.firstName)%20\(self.lastName)"
        

            let url = NSURL(string: self.URLRegisterUser)!
            //request to this file
//            let request = NSMutableURLRequest(url: url as URL)
            let request = NSMutableURLRequest(url: url as URL)
            print("request")
            print(request)
            //method to pass data to this file
            request.httpMethod = "POST"
            //body to be appended to url

            let body = "username=\(userTxt.text!.lowercased())&password=\(passTxt.text!)&email=\(emailTxt.text!)&fullname=\(firstNameTxt.text!)%20\(lastNameTxt.text!)"
            
            request.httpBody = body.data(using: String.Encoding.utf8)
            
            
//Funcionou!
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            
                if error != nil {
                    print("error: \(error)")
                    return
                }
                print("response: \(response)")
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString:\(responseString)")
            }
            task.resume()

            
            
/*            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main){ (response, data, error) in
               
                print("response:")
                print(response)
                print("body")
                print(body.data)
            if let HTTPResponse = response as? HTTPURLResponse {
                let statusCode = HTTPResponse.statusCode
                if statusCode == 200 {
                    
  
                   }
                }
                
                }//Connection: funcionou +- */
            
/*            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data ,response ,error) in
            print("data:")
                print(data)
                if error == nil {

                    
                //    DispatchQueue.main.async{
                    
                        OperationQueue.main.addOperation {

                            
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            print("Data|json:")
                            print(data)
                            print(json)
                            guard let parseJSON = json else {
                                print ("Error While Parsing")
                                return
                            }
                            let id = parseJSON["id"]
                            }
                    }
                }
                }).resume()   */
        }
}
}//class
