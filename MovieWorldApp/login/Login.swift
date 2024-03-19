//
//  Login.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit
import SnapKit
class Login<T:LoginVC>:UIView {
    let controller :T
    private lazy var logoLabel : UILabel =  {
        let label = UILabel()
        label.text = "Cinema+"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    init(_ controller : T) {
        self.controller = controller
        super.init(frame:.zero)
          addSubview(logoLabel)
      
        
        logoLabel.snp.makeConstraints({make in
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
            
            
            
            
        })
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
       
        
    
}
