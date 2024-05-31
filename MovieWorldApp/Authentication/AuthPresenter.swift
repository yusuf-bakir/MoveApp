//
//  LoginPresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
import UIKit
protocol AuthenticationPresenterProtocol {
    
    var view: AuthenticationVCProtocol? { get set }
    var router:AuthenticationRotureProtocol? {get set}
    var ınteractor :AuthInteractorProtocol {get set}
  
    func loginUser (email:String,password:String)
    func loginFailed(withError : String)
    func loginSuccessfull()
 
    
}
class AuthPresenter: AuthenticationPresenterProtocol{
    var ınteractor: AuthInteractorProtocol
    var router: AuthenticationRotureProtocol?
    var view: AuthenticationVCProtocol?
    
    func loginSuccessfull() {
        router?.navigateToHome(from: self.view)
   
    }
    
    func loginUser(email: String, password: String) {
        print("ınteractor login user")
        ınteractor.loginUser(email: email, password: password)
    }
    
    func loginFailed(withError: String) {
        view?.showError(message: withError)
    }
   
     
    init(ınteractor: AuthInteractorProtocol, router: AuthenticationRotureProtocol? = nil, view: AuthenticationVCProtocol? = nil) {
        self.ınteractor = ınteractor
        self.router = router
        self.view = view
    }
   


 
    }
     
        
        

    
    

