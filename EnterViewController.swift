//
//  EnterViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 08/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class EnterViewController: UITabBarController {

    
    var information = Utilidades().getAuthenticatedUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //self.information = Utilidades().getAuthenticatedUser()

        //if the app is closed, it should return the user who is connected to this session.
        if information.isEmpty{
        print("EnterView information: \(self.information)")
//        let oi = HomeViewController()
//        oi.currentUser = "400" // vai pegar la na session do PHP, quem está conectado.
//        information = oi.currentUser
        } else {
        print("Tela ENTER: \(self.information)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
