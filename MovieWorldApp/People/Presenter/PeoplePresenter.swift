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
   
    func getPeople ()

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
    func getPeople() {
        ınteractor?.fetchPeople(complete: { [weak self] item,error in
            if let data = item {
               self?.view?.peopleList(data: data.result)
                print(data)
            }else{
                self?.view?.errorMessage(error: error?.localizedDescription)
               
                
            }
       
            
        })
    }
    
 
}
