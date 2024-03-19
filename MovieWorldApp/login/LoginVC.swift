//
//  LoginVC.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 19.03.2024.
//

import UIKit

final class LoginVC: UIViewController {
    override func loadView() {
            let login = Login(self)
            view = login
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
#Preview {
    LoginVC()
}
