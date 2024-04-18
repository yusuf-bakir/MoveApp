//
//  AuthSigin.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 28.03.2024.
//

import Foundation
import UIKit
import SnapKit

protocol AuthSıgnviewProtocol:AnyObject {
    
    func passwordRegister(_ text: String) ->String
    func emailRegister(_ text: String) ->String
    func passwordRepeat(_ text: String) ->String
    func buttomTappedSigin()
}

final class AuthSigin<T:SigninViewController> :UIView{
   weak  var authDelegateSigin:AuthSıgnviewProtocol?
      var controller : T
    private lazy var label : UILabel  = {
       let textLabel = UILabel()
        textLabel.text = "Cinema +"
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.textColor = .white
        return textLabel
    }()
    
     private lazy var registerEmail: UITextField = {
             let textInput = UITextField()
         textInput.borderStyle = .bezel
         textInput.textColor = .white
         textInput.keyboardType = .asciiCapable
         let attributes: [NSAttributedString.Key: Any] = [
             .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
             .font: UIFont.systemFont(ofSize: 16) ]
         textInput.attributedPlaceholder = NSAttributedString(string: "Enter your Register Mail", attributes: attributes)
         textInput.addTarget(self, action: #selector(repeatDidEmailChange(_:)), for: .editingChanged)
              return textInput
    }()
    @objc func repeatDidEmailChange(_ textField: UITextField) {
            if let text = textField.text {
                
                authDelegateSigin?.emailRegister(text)
            
            }
        }
    
    
    private lazy var registerPassword: UITextField = {
            let textInput = UITextField()
        textInput.borderStyle = .bezel
        textInput.textColor = .white
//        textInput.keyboardType = .asciiCapable
        textInput.isSecureTextEntry = true 
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
            .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        textInput.addTarget(self, action: #selector(registerPasswordDidChange(_:)), for: .editingChanged)
             return textInput
   }()
    @objc func registerPasswordDidChange(_ textField: UITextField) {
            if let text = textField.text {
                authDelegateSigin?.passwordRegister(text)
            
            }
        }
    private lazy var repeatPassword: UITextField = {
            let textInput = UITextField()
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        textInput.isSecureTextEntry = true
//        textInput.keyboardType = .asciiCapable
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
            .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Repeat Password", attributes: attributes)
        textInput.addTarget(self, action: #selector(repeatDidChangePassword(_:)), for: .editingChanged)
             return textInput
   }()
    @objc func repeatDidChangePassword(_ textField: UITextField) {
            if let text = textField.text {
                authDelegateSigin?.passwordRepeat(text)
            
            }
       
        }
    private lazy var siginUpBottom:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Sign in", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.backgroundColor = .red
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.layer.cornerRadius = 16
        buttom.addAction(action, for: .touchUpInside)
        return buttom
    }()
    lazy var action : UIAction = UIAction {_ in
        self.authDelegateSigin?.buttomTappedSigin()
    }
    
    init(_ controller :T) {
        self.controller = controller
        super.init(frame: .zero)
        addSubview(registerEmail)
        addSubview(registerPassword)
        addSubview(repeatPassword)
        addSubview(siginUpBottom)
        addSubview(label)
            setup()
        backgroundColor = UIColor.color1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}

extension AuthSigin {
    private func setup() {
        registerEmail.snp.makeConstraints({ make in
            make.top.equalTo(self.label.snp.bottom).offset(30) // Üst kenardan 200 birim uzaklık
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
                   make.height.equalTo(40)
            
            
            
        })
        registerPassword.snp.makeConstraints({ make in
            make.top.equalTo(registerEmail.snp.bottom).offset(40) // Üst, sol ve sağ kenarları containerView'a yapışık
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        })
        repeatPassword.snp.makeConstraints({ make in
            make.top.equalTo(self.registerPassword.snp.bottom).offset(40)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
            
        })
        siginUpBottom.snp.makeConstraints({ make in
            make.top.equalTo(self.repeatPassword.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
          
            
        })
        label.snp.makeConstraints({ make in
            make.leadingMargin.equalToSuperview().offset(20)
            make.top.equalTo(200)
            
        })
    }
    
   
}
