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
        viewcontroller.tabBarItem = UITabBarItem(title: "second",image: UIImage(systemName: "magnifyingglass"), tag: 1)
                   let tabbarPeople = PeopleViewController()
        tabbarPeople.tabBarItem = UITabBarItem(title: "third", image: UIImage(systemName: "person.circle.fill"), tag: 2)
       
        self.setViewControllers([homeViewcontroller,viewcontroller,tabbarPeople], animated: true)
        self.tabBar.tintColor = .white
        self.tabBar.barStyle = .black

      
        
        
        
        
        
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
