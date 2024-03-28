//
//  AuthSigin.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 28.03.2024.
//

import Foundation
import UIKit
import SnapKit

protocol AuthSıgnProtocol:AnyObject {
    
    
}

final class AuthSigin<T:SigninViewController> :UIView{
   weak  var authDelegateSigin:AuthSıgnProtocol?
      var controller : T
    
    
     private lazy var registerEmail: UITextField = {
             let textInput = UITextField()
         textInput.borderStyle = .bezel
         textInput.textColor = .white
         textInput.isSecureTextEntry = true
         let attributes: [NSAttributedString.Key: Any] = [
             .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
             .font: UIFont.systemFont(ofSize: 16) ]
         textInput.attributedPlaceholder = NSAttributedString(string: "Enter your Register Mail", attributes: attributes)
         
              return textInput
    }()
    
    private lazy var registerPassword: UITextField = {
            let textInput = UITextField()
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        textInput.isSecureTextEntry = true
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
            .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        
             return textInput
   }()
   
    
    
    init(_ controller :T) {
        self.controller = controller
        super.init(frame: .zero)
        addSubview(registerEmail)
//        addSubview(registerPassword)
            setup()
        backgroundColor = UIColor.color1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}

extension AuthSigin:AuthSıgnProtocol {
    private func setup() {
        registerEmail.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            
            
            
            
        })
        registerPassword.snp.makeConstraints({ make in
            
        })
        
    }
    
}
