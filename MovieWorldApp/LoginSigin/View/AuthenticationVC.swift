//
//  LoginVC.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import UIKit
protocol AuthenticationVCProtocol :AnyObject{
   
    var presenterAuth :AuthenticationPresenterProtocol? { get set }
}

class AuthenticationVC: UIViewController, UINavigationControllerDelegate,AuthenticationVCProtocol {

    var presenterAuth :AuthenticationPresenterProtocol?
   
     override func loadView() {
        let authentication = AuthenticationView(self)
        view = authentication
        authentication.AuthDelegate = self
         
        
      
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthenticationRoture.start(ref: self)
        
       
    }

}

    

extension AuthenticationVC:AuthenticationViewProtocol {
    func signinTappedButtom() {
    
        presenterAuth?.navigatePage()
        
       
    
    }
    
    func loginTappedButtom() {
       
        presenterAuth?.navigatePage()
      
      
    }
    
    
}
