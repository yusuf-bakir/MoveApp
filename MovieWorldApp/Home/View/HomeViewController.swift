//
//  HomeViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import UIKit
protocol HomeViewControllerProtocol {
    var viewToPresenter : HomePresenterProtocol?{get set }
}
final class HomeViewController: UIViewController, HomeViewProtocol{
    var viewToPresenter: HomePresenterProtocol?
    
    
    override func loadView() {
        let home = HomeView(self)
        view = home
        home.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
       
       
    }
    
  

   

}
