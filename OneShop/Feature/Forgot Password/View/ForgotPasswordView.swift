//
//  ForgotPasswordView.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImpl (service: ForgotPasswordServiceImpl())
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16) {
                InputTextFieldView(text: $vm.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                ButtonView(title: "Reset Password") {
                    // Handle password reset action
                    vm.sendPasswordReset()
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            .applyClose()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
