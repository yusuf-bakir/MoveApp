//
//  HomeRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
protocol HomeRouterProtocol {
 
    static func creatHomeModule(ref : HomeViewController)
}
final class HomeRouter:HomeRouterProtocol{
    static func creatHomeModule(ref: HomeViewController) {
       let ınteractor = HomeInteractor()
      
        let router = HomeRouter()
        let presenter = HomePresenter(view:ref as! HomeRouterProtocol, router:router ,ınteractor: ınteractor)
        ref.viewToPresenter = presenter
       
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
                 
    }

    
}
