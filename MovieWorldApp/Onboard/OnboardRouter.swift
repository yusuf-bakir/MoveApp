//
//  OnboardRouter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit
protocol OnboardRouterProtocol {
    func navigateToLogin(from view:OnboardViewControllerProtocol?)
   
    
}
final class OnboardRouter :OnboardRouterProtocol{
    
    func navigateToLogin(from view: OnboardViewControllerProtocol?) {
        guard let viewController = view as? UIViewController else { return }
        viewController.navigationController?.navigationBar.tintColor = .white
        viewController.navigationController?.pushViewController(AuthenticationVC(), animated: true)
    }
    
    
    
    static func craeteMyModule() -> UIViewController {
               let view = OnboardMoveContoroller()
        let rotuer:OnboardRouterProtocol = OnboardRouter()
            let presenter = OnboardPresenter(
                OnboardRouter:rotuer,
                viewAuth: view)
      
        view.presenterOnboard = presenter
             return view
    }
    
    
}
