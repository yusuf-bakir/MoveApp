//
//  LoginSiginInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
import Firebase
protocol AuthInteractorProtocol {
    func loginUser(email: String, password: String)
   
    var ınteractorTopresenter :  AuthenticationPresenterProtocol? {get set}
   
}
class AuthInteractor :AuthInteractorProtocol{
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResponse,error) in
            if error != nil {
                self.ınteractorTopresenter?.loginFailed(withError: error?.localizedDescription ?? "" )
            }else{
                self.ınteractorTopresenter?.loginSuccessfull()
                
            }
            
        }
        
    }
    var ınteractorTopresenter: AuthenticationPresenterProtocol?
    
    
  
    
    
    
}
