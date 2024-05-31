//
//  HomeRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//
import UIKit
import Foundation
protocol HomeRouterProtocol {
 
    static func creatHomeModule(ref : HomeViewControllerProtocol)
//    var navigationController: UINavigationController { get set }
    func toDetail(from view : HomeViewControllerProtocol?,id :Int?)
}
final class HomeRouter:HomeRouterProtocol{
    
    func toDetail(from view: HomeViewControllerProtocol?,id:Int?) {
        let detailsViewController = DetailsViewController()
        detailsViewController.id = id ?? 1
        guard let viewController = view as? UIViewController else { return }
        viewController.navigationController?.navigationBar.isHidden = true
        viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    

    static func creatHomeModule(ref: HomeViewControllerProtocol) {
      
       let ınteractor = HomeInteractor()
        let router = HomeRouter()
       
        
        let presenter = HomePresenter(view:ref , router:router ,ınteractor: ınteractor)
        ref.viewToPresenter = presenter
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
        
        
        
//        presenter.ınteractor = ınteractor
//        ref.viewToPresenter?.ınteractor = ınteractor
//        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
        
//        ref.presenterAuth = presenter
//       
//        ref.presenterAuth?.ınteractor = ınteractor
//        ref.presenterAuth?.ınteractor.ınteractorTopresenter = presenter
    
    }


    
}

