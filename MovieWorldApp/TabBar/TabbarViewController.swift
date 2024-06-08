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
        homeViewcontroller.tabBarItem = UITabBarItem(title: "Movie",image: UIImage(systemName: "house"), tag: 0)
     
        let tabbarPeople = PeopleViewController()
        tabbarPeople.tabBarItem = UITabBarItem(title: "People",image: UIImage(systemName: "globe.central.south.asia.fill"), tag: 1)
        let favorite = Favorite()
            
        favorite.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite_favorite_symbol"), tag: 2)
        
        let viewcontroller = ViewController()
        viewcontroller.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)

        self.setViewControllers([homeViewcontroller,tabbarPeople,favorite,viewcontroller], animated: true)
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
