//
//  InputTextFieldView.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//

import SwiftUI

struct InputTextFieldView: View {
    @Binding var text: String // To bind this value to the textfield when user types
    let placeholder: String
    let keyboardType: UIKeyboardType // Keyboard type for email addresses
    let sfSymbol: String? // Icon for email and password, dont need it in all the textfields so its optional
    
    private let textFieldLeading: CGFloat = 30 // Use this to handle the layout where the symbol is placed in the textfield
    
    
    var body: some View {
        // Code responsible for Email TextField
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity,
                   minHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardType)
            .background(
                ZStack(alignment: .leading){
                    if let systemImage = sfSymbol {
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                        .stroke(Color.gray.opacity(0.25))
                }
            ) // TextField for Email ends here
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextFieldView(text: .constant(""),
                           placeholder: "Email",
                           keyboardType: .emailAddress,
                           sfSymbol: "envelope")
    }
}
