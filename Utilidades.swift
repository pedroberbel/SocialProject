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
    var authenticatedUserDefalt = UserDefaults.standard
    let authentication2 = UserDefaults.standard
    
    
    
    
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
        self.authenticatedUserDefalt.set(username, forKey: "authenticatedUser")
        self.authenticatedUserDefalt.synchronize()
        print("definiu usuario: \(username)")
        self.authentication2.set(setAuthentication, forKey: "authenticated")
    }
// get who is connected to the application, using NSUserDefaults
    public func getAuthenticatedUser() -> String {
        
        return self.authenticatedUserDefalt.object(forKey: "authenticatedUser") as! String
    }

    
    public func authentication(username: String, login: Bool) -> Bool{
        if username.isEmpty { //no userName authenticated
        print("Não há ninguém autenticado")
        return false
        } else { //there is username authenticated
        print("Existe Alguém autenticado")
        self.getAuthenticatedUser()
        return true
        }
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
