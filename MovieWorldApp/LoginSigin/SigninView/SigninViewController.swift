//
//  SigninViewController.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 28.03.2024.
//

import UIKit
protocol SigninViewControllerProtocol :AnyObject {
    
}
final class SigninViewController: UIViewController {

    override func loadView() {
        let authSıngn = AuthSigin(self)
        view = authSıngn
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
extension SigninViewController {
    
}
