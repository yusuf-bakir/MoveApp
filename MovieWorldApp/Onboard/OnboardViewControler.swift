//
//  OnboardMove.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 12.03.2024.
//


import UIKit
import SnapKit


protocol OnboardViewControllerProtocol:AnyObject {
    
}
final class OnboardMoveContoroller:UIViewController{
    
    var presenterOnboard: OnboardPresenterProtocol?
    
   
    override func loadView() {
            let onBoardView = OnboardView(self)
            view = onBoardView
            onBoardView.delegate = self
        }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
    
        view.backgroundColor = .color1
        
       
        
    }
    
}
 
extension OnboardMoveContoroller :OnBoardViewProtocol{
    func onTappedContiuneButton() {
       presenterOnboard?.checkAndNavigateTestPage()
       
    
    }
    
}
extension OnboardMoveContoroller :OnboardViewControllerProtocol{
    
}
