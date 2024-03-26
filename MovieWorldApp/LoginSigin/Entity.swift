//
//  Entity.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 22.03.2024.
//

import Foundation
class AuthenticationEntity {
    let userMail:String?
    let userPassword :String?
    init(userMail: String?, userPassword: String?) {
        self.userMail = userMail
        self.userPassword = userPassword
    }
}

