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
    var ınteractor :AuthInteractorProtocol {get set}
    func navigatePage()
    func userAuthLogin(email:String,pasword:String ,complete:@escaping(String,Bool)->Void)
    func userAuthSıgın(email:String,pasword:String ,complete:@escaping(String,Bool)->Void)

    
}
class AuthPresenter: AuthenticationPresenterProtocol{
    
   
   
    var ınteractor: AuthInteractorProtocol
    var router: AuthenticationRotureProtocol?
    var view: AuthenticationVCProtocol?

    init(ınteractor: AuthInteractorProtocol, router: AuthenticationRotureProtocol? = nil, view: AuthenticationVCProtocol? = nil) {
        self.ınteractor = ınteractor
        self.router = router
        self.view = view
    }
    func userAuthSıgın(email: String, pasword: String, complete: @escaping (String, Bool) -> Void) {
        ınteractor.loginUser(email: email, password: pasword, complete: { data ,error in
            
            
            
        })
    }
    

    
    func userAuthLogin(email: String, pasword: String, complete: @escaping (String, Bool) -> Void) {
        ınteractor.loginUser(email: email, password: pasword, complete: { data,error  in
            
        })
    }
    

    func navigatePage() {
        print("navigatePage çalıştı")
        router?.navigateToHome(from: self.view)
       
        
    }
     
        
    }

    
    

