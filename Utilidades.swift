//
//  Utilidades.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 07/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//
// This Class will work with some objects design that could be used in any view.

import Foundation
import UIKit

class Utilidades {
    
    //Userdefault variables information
    var activeUser = UserDefaults.standard
    
    
    
    
    //Alerts
    public func yellowAlert(message: String) {
    }
    
    public func greenAlert() {
    }
    
    public func redAlert() {
    }

    
    
    //Authentication

// save who is connected to the application, using NSUserDefaults
    public func setAuthenticatedUser(username: String,_ setAuthentication: Bool){
        self.activeUser.set(username, forKey: "loginUser")
        self.activeUser.synchronize()

    }
// get who is connected to the application, using NSUserDefaults
    public func getAuthenticatedUser() -> String {
        
        return self.activeUser.object(forKey: "loginUser") as! String
    }

    
    public func authentication(username: String, login: Bool) -> Bool{
        if username.isEmpty { //no userName authenticated
        print("Não há ninguém autenticado")
        return false
        } else { //there is username authenticated
        print("Existe Alguém autenticado")
        return true
        }
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
