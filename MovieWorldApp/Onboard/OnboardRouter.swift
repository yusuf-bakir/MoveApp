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
        viewController.navigationController?.pushViewController(LoginVC(), animated: true)
    }
    
    
    
    static func craeteMyModule() -> OnboardMoveContoroller {
               let view = OnboardMoveContoroller()
              let rotuer = OnboardRouter()
        let presenter = OnboardPresenter(
        router: rotuer,
        view: view
        )
        view.presenter = presenter
             return view
    }
    
    
}
