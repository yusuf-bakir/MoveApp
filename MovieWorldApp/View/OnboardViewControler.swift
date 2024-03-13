//
//  OnboardMove.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 12.03.2024.
//


import UIKit
import SnapKit

final class OnboardMove:UIViewController{
    override func loadView() {
            let onBoardView = OnboardView(self)
            view = onBoardView
            onBoardView.delegate = self
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorGray
    
       
        
    }
    
}
//#Preview{
//    OnboardMove()
//}
extension OnboardMove :OnBoardViewProtocol{
    func onTappedContiuneButton() {
    print("hello")
    }
    
}
