//
//  LoginCredentials.swift
//  OneShop
//
//  Created by user198375 on 11/8/21.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials{
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
