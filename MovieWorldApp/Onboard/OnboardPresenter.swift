//
//  OnboardPresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit

protocol OnboardPresenterProtocol:AnyObject{
    
    var router: OnboardRouterProtocol? { get set }
    var view: OnboardViewControllerProtocol? { get set }
    func checkAndNavigateTestPage()
}



final class OnboardPresenter:OnboardPresenterProtocol{
    init(router: OnboardRouterProtocol? = nil, view: OnboardViewControllerProtocol? = nil) {
        self.router = router
        self.view = view
    }
    var router: OnboardRouterProtocol?
    
    var view: OnboardViewControllerProtocol?
    
    func checkAndNavigateTestPage() {
        router?.navigateToLogin(from: self.view)
    }
    
    
    
    
}
