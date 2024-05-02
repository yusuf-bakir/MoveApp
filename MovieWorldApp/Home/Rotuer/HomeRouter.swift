//
//  HomeRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
protocol HomeRouterProtocol :AnyObject{
 
    static func creatHomeModule(ref : HomeViewControllerProtocol)
}
final class HomeRouter:HomeRouterProtocol{
  
   
    
    static func creatHomeModule(ref: HomeViewControllerProtocol) {
       let ınteractor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view:ref , router:router ,ınteractor: ınteractor)
        ref.viewToPresenter = presenter
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
        
        
     
                 
    }

    
}
