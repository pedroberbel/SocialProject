//
//  HomeViewController.swift
//  SocialProject
//
//  Created by Pedro Luis Berbel dos Santos on 06/03/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var testeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fastPageControll: UIPageControl!
    @IBOutlet weak var fastDetailView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!

    var activeUser = UserDefaults.standard //key: loginUser

//    var currentUser = String()
   
//    let greenBlue 
    
    var views :[UIColor] = [Colors().GreenBlue(), Colors().NiceRed(), Colors().YellowCard()]
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tela de dentro, activeUser: \(self.activeUser.object(forKey: "loginUser"))")
        let currentUser = self.activeUser.object(forKey: "loginUser") as! String

        self.fastPageControll.backgroundColor = Colors().GreenBlue()
        
        self.usernameLabel.text = currentUser
        print("Home, Usuario: \(currentUser)")
        
        fastPageControll.numberOfPages = views.count
        for index in 0..<views.count {
                //print("index: \(index)")
                frame.origin.x = scrollView.frame.size.width * CGFloat(index)
                frame.size = scrollView.frame.size
                let view = UIView(frame: frame)
                view.backgroundColor = views[index]
//                view.layer.borderColor = UIColor.white.cgColor
//                view.layer.borderWidth = 7
                //create a padding on both sides of the view.
                view.bounds = view.frame.insetBy(dx: 7.0, dy: 0.0)
                view.layer.cornerRadius = 5
                self.scrollView.addSubview(view)
            
            
        }
            
            scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(views.count), height: scrollView.frame.size.height)
            
            scrollView.delegate = self
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        fastPageControll.currentPage = Int(pageNumber)
        fastPageControll.currentPageIndicatorTintColor = views[fastPageControll.currentPage]
    }
        
        
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 



    
    
    
    
    
    
}















