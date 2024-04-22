//
//  HomePresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
protocol HomePresenterProtocol{
    var view : HomeRouterProtocol?{get set}
    var router :HomeRouterProtocol?{get set}
    var ınteractor: HomeInteractorProtocol?  {get set}
        

}
final class HomePresenter:HomePresenterProtocol{
    var view: HomeRouterProtocol?
    
    var router: HomeRouterProtocol?
    
    var ınteractor: HomeInteractorProtocol?
    init(view: HomeRouterProtocol? = nil, router: HomeRouterProtocol? = nil, ınteractor: HomeInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.ınteractor = ınteractor
    }
    
}
