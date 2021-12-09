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
        VStack(alignment: .leading, spacing: 16) {
            NavigationLink(destination: ProductSelection(), tag: 1, selection: $navigationTag  ){}
            
            NavigationLink(destination: ForwardGeoView(), tag: 1, selection: $geoViewTag  ){}
            
//            Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
//            Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
//            Text("Occupation: \(sessionService.userDetails?.occupation ?? "N/A")")
        }
            Group{
                //button to navigate to the Product Selection view
                Button(action:{
                    self.navigationTag = 1
                    print("Value is \(self.$navigationTag)")
                 
                }){
                    Text("Click To View Products")
                }
                
                Button(action:{
                    self.geoViewTag = 1
                    print("Value is \(self.$geoViewTag)")
                 
                }){
                    Text("Click Here To Enter Your Coordinates")
                }
                
                
            }
            ButtonView(title: "Logout") {
                // Handle logout action here
                sessionService.logout()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("OneShop")
    }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
            .environmentObject(SessionServiceImpl())
        }
    }
}

