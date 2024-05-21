//
//  PeopleRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 18.04.2024.
//

import Foundation
protocol PeopleRouterProtocol {
    static func creatPeopleModule( ref : PeopleViewProtocol)
}
final class PeopleRouter:PeopleRouterProtocol {
 
    
    static func creatPeopleModule(ref: PeopleViewProtocol) {
        let ınteractor = PeopleInteractor()
        let router = PeopleRouter()
        let presenter = PeoplePresenter(router: router,ınteractor: ınteractor,view: ref)
        ref.viewToPresenter = presenter
        ref.viewToPresenter?.ınteractor = ınteractor
        ref.viewToPresenter?.ınteractor?.ınteractorTopresenter = presenter
        
        
        
        
  
  
        
    }
    
    
}
