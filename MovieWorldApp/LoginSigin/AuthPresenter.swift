//
//  LoginPresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
protocol AuthenticationPresenterProtocol {
   
    var view: AuthenticationVCProtocol? { get set }
    var router:AuthenticationRotureProtocol? {get set}
    func navigatePage()
    
}
class AuthPresenter: AuthenticationPresenterProtocol{
    var router: AuthenticationRotureProtocol?
    var view: AuthenticationVCProtocol?

    init(router: AuthenticationRotureProtocol? = nil, view: AuthenticationVCProtocol? = nil) {
        self.router = router
        self.view = view
    }
    func navigatePage() {
        print("navigatePage çalıştı")
        router?.navigateToHome(from: self.view)
       
        
    }

    

    

    
    
}
