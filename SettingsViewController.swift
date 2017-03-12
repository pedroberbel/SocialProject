//
//  SettingsViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 06/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource {

    var currentUser = String()

    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
       let getter = Utilidades()
        self.currentUser = getter.getAuthenticatedUser()
        self.view.backgroundColor = Colors().YellowCard()
        self.tableView.sectionIndexColor = Colors().YellowCard()
        self.tabBarController?.tabBar.isTranslucent = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    //TableView:
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "sectionname"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        //user's overView
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SettingsTableViewCell
        cell.userAvatarImage.clipsToBounds = true
        cell.userAvatarImage.layer.cornerRadius = 41
        cell.usernameLabel.text! = self.currentUser
        cell.frame.size.height = 98
        self.tableView.rowHeight = 98
        
        return cell
        } else if indexPath.row == 1{
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell") as! EditTableViewCell
            self.tableView.rowHeight = 44
            return cell
        } else if indexPath.row == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passCell") as! changePassTableViewCell
        return cell
        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logoutCell") as! logoutTableViewCell
            
        cell.isUserInteractionEnabled = true
       
        return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logOut"{
            let logOut = segue.destination as! LoginViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = 3
//            selectedUser = self.userURL[row]
//            searchUserVC.userLink = selectedUser
        }
    }
 


}
