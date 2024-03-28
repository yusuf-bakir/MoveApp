//
//  LoginRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
import UIKit

protocol AuthenticationRotureProtocol {
   func navigateToHome(from view :AuthenticationVCProtocol?)
    static func start(ref : AuthenticationVC)

    
}
final class AuthenticationRoture :AuthenticationRotureProtocol {
    func navigateToHome(from view: AuthenticationVCProtocol?) {
        guard let viewController = view as? UIViewController else { return }
        viewController.navigationController?.navigationBar.tintColor = .white
        viewController.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    static func start(ref: AuthenticationVC) {
        var ınteractor  = AuthInteractor()
        let router = AuthenticationRoture()
        let presenter = AuthPresenter(ınteractor: ınteractor, router:router ,view:ref )
        ref.presenterAuth = presenter
        
              
    
        
    }
    
    
    
  
    

  

//    

    }
    
