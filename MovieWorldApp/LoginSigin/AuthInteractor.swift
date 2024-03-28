//
//  LoginSiginInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
protocol AuthInteractorProtocol {
    func loginUser(email: String, password: String, complete: @escaping (String?, Error) ->Void)
    func signIn(email: String, password: String, complete: @escaping (String?, Error) -> Void)
    var ınteractorTopresenter :  AuthenticationPresenterProtocol? {get set}
   
}
class AuthInteractor :AuthInteractorProtocol,UserNetworkProtolocol{
    func loginUser(email: String, password: String, complete: @escaping (String?, Error) -> Void) {
        print("login fonksiyonu çalıştı")
    }
    
    func signIn(email: String, password: String, complete: @escaping (String?, Error) -> Void) {
        
    }
    
    var ınteractorTopresenter: AuthenticationPresenterProtocol?
    
    
  
    
    
    
}
