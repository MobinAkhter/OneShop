//
//  RegistrationDetails.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
// Has all the variables that are needed for the Registration to happen successfully in the RegisterView

import Foundation

struct RegistrationDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
//    var occupation: String
    
}

extension RegistrationDetails {
    static var new: RegistrationDetails{
        RegistrationDetails(email: "", password: "", firstName: "", lastName: "") // took out occupation
    }
}

