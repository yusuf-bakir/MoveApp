//
//  PeoplePresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 18.04.2024.
//

import Foundation
protocol PeoplePresenterProtocol{
    var router: PeopleRouterProtocol? {get set}
    var ınteractor : PeopleInteractorProtocol?{get set }
    var view: PeopleViewProtocol?{get set }
}
final class PeoplePresenter:PeoplePresenterProtocol {
    var router: PeopleRouterProtocol?
    
    var ınteractor: PeopleInteractorProtocol?
    
    weak var view: PeopleViewProtocol?
    

    init(router: PeopleRouterProtocol? = nil, ınteractor: PeopleInteractorProtocol? = nil, view: PeopleViewProtocol? = nil) {
        self.router = router
        self.ınteractor = ınteractor
        self.view = view
    }
  
}
