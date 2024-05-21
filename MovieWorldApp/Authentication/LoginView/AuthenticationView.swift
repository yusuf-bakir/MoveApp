//
//  Login.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit
import SnapKit

protocol AuthenticationViewProtocol:AnyObject {
    func signinTappedButtom()
    func loginTappedButtom ()
    func passwordInput(_ text: String) ->String
    func emailInput(_ text: String) ->String
    func labelTapp()
   
}
   
  class AuthenticationView<T:AuthenticationVC>:UIView {
    var controller :T
    weak var AuthDelegate:AuthenticationViewProtocol?
     
      
      
      // MARK: - logoLabel
    private lazy var logoLabel : UILabel =  {
        let label = UILabel()
        label.text = "Cinema+"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        
        return label
    
    }()
      @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        
          }
    
      // MARK: - textFiledPassword
    private lazy var textFiledPassword :UITextField = {
        let textInput = UITextField()
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        textInput.isSecureTextEntry = true
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
            .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        textInput.addTarget(self, action: #selector(textFieldDidChangePassword(_:)), for: .editingChanged)
        return textInput
    }()
      
      @objc func textFieldDidChangePassword(_ textField: UITextField) {
              if let text = textField.text {
                  self.AuthDelegate?.passwordInput(text)
              
              }
          }
    
      // MARK: - TextFiledEmail
    
    private lazy var TextFiledEmail:UITextField = {
        let textInput = UITextField()
       
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
                    .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: attributes)
        textInput.addTarget(self, action: #selector(textFieldDidChangeEmail(_:)), for: .editingChanged)
       return textInput
    }()
      
      // MARK: - textFieldDidChangeEmail
      
      @objc func textFieldDidChangeEmail(_ textField: UITextField) {
              if let text = textField.text {
                  
                  AuthDelegate?.emailInput(text)
              }
          }
    
    

      // MARK: - View ımageLogo
      
    private lazy var ımageLogo :UIImageView = {
       let ımage = UIImageView()
        ımage.image = UIImage.play
        ımage.contentMode = .scaleAspectFit
        ımage.translatesAutoresizingMaskIntoConstraints = false
        ımage.isUserInteractionEnabled = true
              return ımage
    }()
      // MARK: - View Image for animation 
      func animateImage() {
          UIView.animate(withDuration: 0.5,delay: 0.0,options: [.repeat,.autoreverse], animations: {
                  self.ımageLogo.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
              }) { _ in
                  UIView.animate(withDuration: 0.5) {
                      self.ımageLogo.transform = CGAffineTransform.identity
                  }
              }
          }
  
      // MARK: - View registerLabel
    private lazy var  registerLabel : UILabel = {
        let label = UILabel()
        label.text = "Forgot your Password ?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.isUserInteractionEnabled = true
        return label
    }()
      // MARK: - View loginButtom
    private lazy var loginButtom:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Login", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.backgroundColor = .red
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.layer.cornerRadius = 16
        buttom.addTarget(self, action: #selector(buttonTappedlogin), for: .touchUpInside)

     return buttom
    }()
      // MARK: - View signinButtom
    private lazy var signinButtom:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Sign in", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.backgroundColor = .red
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.layer.cornerRadius = 16
        buttom.addAction(action, for: .touchUpInside)
     return buttom
    }()
      // MARK: - Buttom action
      lazy var action : UIAction = UIAction {_ in
          self.AuthDelegate?.signinTappedButtom()
      }
  
      
    @objc func buttonTappedlogin () {
        AuthDelegate?.loginTappedButtom()
    }
      // MARK: - init
    init(_ controller :T) {
        self.controller = controller
            
        super.init(frame:.zero)
        self.animateImage()
        addSubview(logoLabel)
        addSubview(TextFiledEmail)
        addSubview(textFiledPassword)
        addSubview(ımageLogo)
        addSubview(registerLabel)
        addSubview(loginButtom)
        addSubview(signinButtom)
        backgroundColor = UIColor.color1
        stupCompenent()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        logoLabel.isUserInteractionEnabled = true
        logoLabel.addGestureRecognizer(tapGesture)
    }
      
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
   
    
       

    
}

extension AuthenticationView {

       private func stupCompenent(){
 
        
        
        logoLabel.snp.makeConstraints({make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        })
        ımageLogo.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
            make.top.equalTo(logoLabel.snp.bottom).offset(60)
            
        })
        TextFiledEmail.snp.makeConstraints({make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(self.ımageLogo.snp.bottom).offset(100)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
            
            
        })
        textFiledPassword.snp.makeConstraints({ make in
            make.top.equalTo(TextFiledEmail.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        })
        registerLabel.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.textFiledPassword.snp.bottom).offset(10)
            
        })
        loginButtom.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(registerLabel.snp.bottom).offset(50)
            
            
        })
        signinButtom.snp.makeConstraints({make in
            
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(loginButtom.snp.bottom).offset(20)
            
            
            
        })
        
    }
}
