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
    
    
    let authenticatedUserDefalt = UserDefaults.standard

    //Alerts
    public func yellowAlert(message: String) {
    }
    
    public func greenAlert() {
    }
    
    public func redAlert() {
    }

    
    
    //Authentication

// save who is connected to the application, using NSUserDefaults
    public func setAuthenticatedUser(username: String){
        self.authenticatedUserDefalt.set(username, forKey: "authenticatedUser")
        self.authenticatedUserDefalt.synchronize()
        print("definiu usuario: \(username)")
    }
// get who is connected to the application, using NSUserDefaults
    public func getAuthenticatedUser() -> String {
   
        return self.authenticatedUserDefalt.object(forKey: "authenticatedUser") as! String
    
    }

    
    
    
    
}
