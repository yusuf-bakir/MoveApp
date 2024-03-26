//
//  OnboardPresenter.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit

protocol OnboardPresenterProtocol:AnyObject{
    
    var OnboardRouter: OnboardRouterProtocol? { get set }
    var viewAuth: OnboardViewControllerProtocol? { get set }
    func viewDidLoad()
    func checkAndNavigateTestPage()
}



final class OnboardPresenter:OnboardPresenterProtocol{
    func viewDidLoad() {
        print("onboradprotocol")
    }
    
    init(OnboardRouter: OnboardRouterProtocol? = nil, viewAuth: OnboardViewControllerProtocol? = nil) {
        self.OnboardRouter = OnboardRouter
        self.viewAuth = viewAuth
    }
    var OnboardRouter: OnboardRouterProtocol?
    
    var viewAuth: OnboardViewControllerProtocol?
    
    func checkAndNavigateTestPage() {
        OnboardRouter?.navigateToLogin(from: self.viewAuth)
    }
    
    
    
    
}
