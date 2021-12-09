//
//  LoginView.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false  // is used with sheet modifier to handle presentation. When user clicks on register button, this value toggles to true
    @State private var showForgotPassword = false // same as above but with forgot password button this time
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                // Using Base Views InputTextFieldView
                InputTextFieldView(text: $vm.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                 
                InputPasswordView(password: $vm.credentials.password,
                                   placeholder: "Password",
                                   sfSymbol: "lock")
            }//VStack-Inner
            HStack{
                Spacer()
                Button(action: {
                    // Provide view to forget password
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                })
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword,
                    content: {
                        ForgotPasswordView()
                    })
            }//HStack-Inner
            
            VStack(spacing: 16) {
                // Using Base View ButtonView
                ButtonView(title: "Login"){
                    // Handle login action
                    vm.login()
                }
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: .blue,
                           border: .blue){
                    // Handle presentation to register
                    showRegistration.toggle()
                }
                // Binding our showRegistration to the sheet modifier. If its true, display RegisterView()
                .sheet(isPresented: $showRegistration,
                       content: {
                        RegisterView()
                       })
            }//VStack-Outer
            
            
        }//VStack
        .padding(.horizontal, 15)
        .navigationTitle("Login")
        .alert(isPresented: $vm.hasError,
               content: {
                if case .failed(let error) = vm.state {
                    return Alert(title: Text("Error"),
                                 message: Text(error.localizedDescription))
                }else {
                    return Alert(title: Text("Error"),
                                 message: Text("Something went wrong"))
                }
               })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        LoginView()
        }
    }
}

