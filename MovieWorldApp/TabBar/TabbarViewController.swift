//
//  TabbarViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 2.04.2024.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        showMainApp()
        let homeViewcontroller = HomeViewController()
        homeViewcontroller.tabBarItem = UITabBarItem(title: "first",image: UIImage(systemName: "house"), tag: 0)
        let viewcontroller = ViewController()
        viewcontroller.tabBarItem = UITabBarItem(title: "second",image: UIImage(systemName: "star"), tag: 1)
       
       
        self.setViewControllers([homeViewcontroller,viewcontroller], animated: true)
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor  = .gray
      
        
        
        
        
        
    }
    

//    func showMainApp() {
//    func showMainApp() {
//          // TabBarController ve diğer ViewController'ları oluşturun
//          let tabBarController = UITabBarController()
//
//          let firstViewController = HomeViewController()
//       
//          firstViewController.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
//
//          let secondViewController = ViewController()
// 
//          secondViewController.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
//
//          // ViewController'ları TabBarController'a ekleyin
//          tabBarController.viewControllers = [firstViewController, secondViewController]
//          // TabBarController'ı ana view controller olarak belirleyin
//  
//      }
//    
    
}
