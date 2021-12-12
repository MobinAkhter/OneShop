//
//  HomeView.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//  Overall code reference: Class lectures, youtube videos, and online articles, as well as apple docs

import SwiftUI
        struct HomeView: View {
    
            @EnvironmentObject var sessionService: SessionServiceImpl // Next thing todo after adding this: set it in the previews
            
            @State private var navigationTag: Int? = nil
            @State private var shoppingCartTag: Int? = nil
            @State private var geoViewTag: Int? = nil
            var body: some View {
                
                
                NavigationView{
                VStack(alignment: .leading, spacing: 16) {
                    NavigationLink(destination: ProductSelection(), tag: 1, selection: $navigationTag  ){}
                    
                    NavigationLink(destination: ForwardGeoView(), tag: 1, selection: $geoViewTag  ){}
                    NavigationLink(destination: ShoppingCart(), tag: 1, selection: $shoppingCartTag  ){}
                    
                    ButtonView(title: "View Products"){
                        self.navigationTag = 1
                        print("Value is \(self.$navigationTag)")
                     
                    }

                    
                    ButtonView(title: "View Shopping Cart"){
                        self.shoppingCartTag = 1
                        print("Value is \(self.$shoppingCartTag)")
                     
                    }
                    
                    
                    ButtonView(title: "Enter Your Location Coordinates"){
                        self.geoViewTag = 1
                        print("Value is \(self.$geoViewTag)")
                     
                    }
                    
                    ButtonView(title: "Logout",
                               background: .clear,
                               foreground: .blue,
                               border: .blue) {
                        // Handle logout action here
                        sessionService.logout()
                    }

                }
                
                }.padding(.horizontal, 16)
                .navigationTitle("OneShop Home")
                
                    
                }
            
            }
            

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(SessionServiceImpl())
            
        
    }
}

