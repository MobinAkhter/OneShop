//
//  LoginCredentials.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//
//  Uses email and password as two variables that will be checked later on to see
//  if they are the same as the ones in the cloud database

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
