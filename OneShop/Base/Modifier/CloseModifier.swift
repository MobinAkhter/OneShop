//
//  CloseModifier.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//
import SwiftUI

struct CloseModifier: ViewModifier {

@Environment(\.presentationMode) var presentationMode

func body(content: Content) -> some View {
    content
        .toolbar{
            // X button to cancel/exit view
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            })
        }
}
}

extension View {
func applyClose() -> some View {
    self.modifier(CloseModifier())
}
}
