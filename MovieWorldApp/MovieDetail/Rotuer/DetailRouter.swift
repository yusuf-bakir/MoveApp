//
//  DetailRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 24.05.2024.
//

import Foundation
import UIKit
protocol DetailRouterProtocol {
    static func  creatMyDetailModule (ref : DetailViewControllerProtocol)
    func showHome (from view:DetailViewControllerProtocol?)
}
final class DetailRouter:DetailRouterProtocol {
    func showHome(from view: DetailViewControllerProtocol?) {
        let secondViewController = HomeViewController()
        guard let viewController = view as? UIViewController else { return }
        viewController.navigationController?.navigationBar.isHidden = true
        viewController.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
//    
//    
//
//
//    
    
    
    
    static func creatMyDetailModule(ref: DetailViewControllerProtocol) {
        let ınteractor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view:ref  ,ınteractor:ınteractor ,router: router)
        ref.viewToPresenter = presenter
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.toPresenter = presenter
        
        
    }

    //let presenter = DetailPresenter(view:ref , router:router ,ınteractor: ınteractor)
    //ref.viewToPresenter = presenter
    //ref.viewToPresenter?.ınteractor = ınteractor
    //ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
}
