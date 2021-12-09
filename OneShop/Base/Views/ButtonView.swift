//
//  ButtonView.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//

import SwiftUI

struct ButtonView: View {
        
    typealias ActionHandler = () -> Void // purpose of our closure becomes more clear
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    // specifying default color value
    internal init(title: String, background: Color = .blue, foreground: Color = .white, border: Color = .clear, handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Primary (Login) Button") {}
    }
}
