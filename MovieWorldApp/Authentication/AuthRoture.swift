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
 class AuthenticationRoture :AuthenticationRotureProtocol {
    
    
    func navigateToHome(from view: AuthenticationVCProtocol?) {
         let Tabbar = TabbarViewController()
        guard let viewController = view as? UIViewController else { return }
        viewController.navigationController?.navigationBar.tintColor = .white
        viewController.navigationController?.navigationBar.isHidden = true

        viewController.navigationController?.pushViewController(Tabbar, animated: true)
    }
    
    static func start(ref: AuthenticationVC) {
        let ınteractor  = AuthInteractor()
        let router = AuthenticationRoture()
        let presenter = AuthPresenter(ınteractor: ınteractor, router:router ,view:ref )
        ref.presenterAuth = presenter
        ref.presenterAuth?.ınteractor = ınteractor
        ref.presenterAuth?.ınteractor.ınteractorTopresenter = presenter
        
        
    }
    
    
    
  
    

  

//    

    }
    
