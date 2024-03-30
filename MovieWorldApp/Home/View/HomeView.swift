//
//  HomeView.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
import UIKit
protocol HomeViewProtocol{
    
    
}




final class HomeView<T:HomeViewController>:UIView{
    
    var delegate  :HomeViewProtocol?
    var controller : T
    
    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
