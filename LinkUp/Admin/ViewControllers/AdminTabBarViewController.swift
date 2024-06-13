//
//  AdminTabBarViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 14/04/2023.
//

import Foundation
import UIKit

class AdminTabBarViewController : UIViewController {
    
    // Create the tab bar controller
    let adminTabBarController : UITabBarController = {
        let tb = UITabBarController()
        // Create the root view controllers for each tab
        let viewController1 = UINavigationController(rootViewController: AdminDashboard())
        let viewController2 = UINavigationController(rootViewController: RegisterTeacherViewController())
        let viewController3 = UINavigationController(rootViewController: PlusVC())
        let viewController4 = UINavigationController(rootViewController: RegisterStudentViewController())
        let viewController5 = UINavigationController(rootViewController: AdminSideMoreViewController())
        


        tb.setViewControllers([viewController1, viewController2, viewController3, viewController4 , viewController5], animated: false)
        
        viewController1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        viewController2.tabBarItem = UITabBarItem(title: "calander", image: UIImage(systemName: "calendar"), tag: 1)
        viewController3.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 40))), tag: 2)
        viewController4.tabBarItem = UITabBarItem(title: "Message", image: UIImage(systemName: "message"), tag: 3)
        viewController5.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "person"), tag: 4)
        tb.tabBar.tintColor = UIColor(named: "mediumPurple")
        return tb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(adminTabBarController)
//        FirestoreManager.shared.loadAdminRecord()
        view.addSubview(adminTabBarController.view)
        adminTabBarController.didMove(toParent: self)
    }
    
}
