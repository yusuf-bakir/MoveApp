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
       
     final class AuthenticationVC: UIViewController, UINavigationControllerDelegate,AuthenticationVCProtocol {
           var presenterAuth :AuthenticationPresenterProtocol?
           var AuthDelegate:AuthenticationViewProtocol?
        private var passwordText = ""
        private var emailText =  ""
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
    func passwordInput(_ text: String) -> String {
        passwordText = text
        return passwordText
    }
    
    func emailInput(_ text: String) -> String {
        emailText = text
        return emailText
    }
    
    func labelTapp() {
        print("label tapp")
        
    }
    

   
    func animationImage() {
   
    }
    
    func signinTappedButtom() {
        let secondViewController = SigninViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
        
    
    }
    
    func loginTappedButtom() {
        presenterAuth?.userAuthLogin(email: emailText, pasword: passwordText, complete: { message,error in 
            
        })
     
      presenterAuth?.navigatePage()
    
      
    }
    @objc func dismissSelf() {
            self.dismiss(animated: true, completion: nil)
        }
    
    
}
