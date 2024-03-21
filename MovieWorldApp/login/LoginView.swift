//
//  Login.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import Foundation
import UIKit
import SnapKit
class LoginView<T:LoginVC>:UIView {
    var controller :T
    
    
    private lazy var logoLabel : UILabel =  {
        let label = UILabel()
        label.text = "Cinema+"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    
    }()
    
    
    private lazy var textFiledPassword :UITextField = {
        let textInput = UITextField()
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
            .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        return textInput
    }()
    
    
    
    private lazy var TextFiledEmail:UITextField = {
        let textInput = UITextField()
       
        textInput.borderStyle = .bezel
        textInput.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, //Yeni renk burada ayarlanabilir
                    .font: UIFont.systemFont(ofSize: 16) ]
        textInput.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: attributes)
        
       return textInput
    }()
    private lazy var ımageLogo :UIImageView = {
       let ımage = UIImageView()
        ımage.image = UIImage.play
        ımage.contentMode = .scaleAspectFit
        ımage.translatesAutoresizingMaskIntoConstraints = false
              return ımage
    }()
    private lazy var  registerLabel : UILabel = {
        let label = UILabel()
        label.text = "Forgot your Password ?"
        label.textColor = .white
        label.isUserInteractionEnabled = true
        return label
    }()
    private lazy var loginButtom:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Login", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.backgroundColor = .red
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.layer.cornerRadius = 16
//        buttom.addAction(action, for: .touchUpInside)
     return buttom
    }()
    private lazy var signinButtom:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Singin", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.backgroundColor = .red
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.layer.cornerRadius = 16
//        buttom.addAction(action, for: .touchUpInside)
     return buttom
    }()
    
    
    
    
    init(_ controller :T) {
        self.controller = controller
        super.init(frame:.zero)
        
          addSubview(logoLabel)
        addSubview(TextFiledEmail)
        addSubview(textFiledPassword)
        addSubview(ımageLogo)
        addSubview(registerLabel)
        addSubview(loginButtom)
        addSubview(signinButtom)
        backgroundColor = UIColor.color1
        stupCompenent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
       

    
}
#Preview {
    LoginVC()
}
extension LoginView {
    func stupCompenent(){
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
