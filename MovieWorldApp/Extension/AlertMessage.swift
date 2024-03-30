//
//  AlertMessage.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 29.03.2024.
//

import Foundation
import UIKit
extension UIViewController{
    func addAlert(title: String, message: String) -> UIAlertController{
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okeyAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okeyAction)
            return alert
        }
}
