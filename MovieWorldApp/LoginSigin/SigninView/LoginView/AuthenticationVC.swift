//
//  LoginVC.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import UIKit
protocol AuthenticationVCProtocol :AnyObject{
    func showError(message: String)
   
    var presenterAuth :AuthenticationPresenterProtocol? { get set }
}
       
final class AuthenticationVC: UIViewController, UINavigationControllerDelegate {

    
           var presenterAuth :AuthenticationPresenterProtocol?
           var AuthDelegate:AuthenticationViewProtocol?
        private var passwordText = ""
        private var emailText =  ""
     override func loadView() {
        let authentication = AuthenticationView(self)
        view = authentication
        authentication.AuthDelegate = self
    
         
        
      
        }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let authentication = AuthenticationView(self)
//        authentication.AuthDelegate = self
//        authentication.AuthDelegate?.animatioImage()
//       
//    }
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthenticationRoture.start(ref: self)
       
    
        
       
    }

}

    

extension AuthenticationVC:AuthenticationViewProtocol {
  
  
    
    func passwordInput(_ text: String) -> String {
        passwordText = text
        print(passwordText)
        return passwordText
           
    }
    
    func emailInput(_ text: String) -> String {
        emailText = text
        print(emailText)
        return emailText
       
    }
    
    func labelTapp() {
        print("label tapp")
        
    }
    

   
    func animationImage() {
   
    }
    
    func signinTappedButtom() {
        let secondViewController = SigninViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
        
    
    }
    
    func loginTappedButtom() {
       
        presenterAuth?.loginUser(email: emailText, password: passwordText)
      
    }
    
    
}
extension AuthenticationVC:AuthenticationVCProtocol {
    func showError(message: String) {
   let showErrorLogin = addAlert(title: "Uyarı", message: message)
        present(showErrorLogin, animated: true, completion: nil)
        
    }
    
    
    
}
#Preview {
    AuthenticationVC()
}
