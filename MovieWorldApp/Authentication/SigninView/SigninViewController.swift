//
//  SigninViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 28.03.2024.
//

import UIKit
import Firebase
protocol SigninViewControllerProtocol :AnyObject {
    
}
final class SigninViewController: UIViewController {
          private var emailText = ""
         private var repeatPassworText = ""
        private var passwordText = ""
    
    override func loadView() {
        let authSıngn = AuthSigin(self)
        view = authSıngn
        authSıngn.authDelegateSigin = self
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
extension SigninViewController :AuthSıgnviewProtocol{
    func buttomTappedSigin() {
        
        
        
        if emailText != ""  && passwordText != ""  && repeatPassworText != "" && repeatPassworText == passwordText{
            Auth.auth().createUser(withEmail:emailText , password: repeatPassworText) { (authdata ,error) in
                if  error != nil  {
                    let authError =  self.addAlert(title: "UYARI", message: error?.localizedDescription ?? "")
                    self.present(authError, animated: true, completion: nil)
                }else {
                    self.navigationController?.navigationBar.isHidden = true
                    self.navigationController?.pushViewController(ViewController(), animated: true)
                    SigninViewController().dismiss(animated: true)

                }
                
            }
        }else{
            let a =  addAlert(title: "UYARI", message: "Gerekli Alanları Doldurunuz")
            self.present(a, animated: true, completion: nil)
                 

        }
        
        
     }
    
    func passwordRegister(_ text: String) -> String {
        passwordText = text
     
        return passwordText
    }
    
    func emailRegister(_ text: String) -> String {
        emailText = text
    
        return emailText
        
    }
    
    func passwordRepeat(_ text: String) -> String {
        repeatPassworText = text

        return repeatPassworText
    }
    
    
}
