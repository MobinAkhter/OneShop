//
//  HomeView.swift
//  OneShop
//
//  Created by user198375 on 11/8/21.
//  Code reference: Youtube Video

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl // Next thing todo after adding this: set it in the previews
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
        VStack(alignment: .leading, spacing: 16) {
            Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
            Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
            Text("Occupation: \(sessionService.userDetails?.occupation ?? "N/A")")
        }
            ButtonView(title: "Logout") {
                // Handle logout action here
                sessionService.logout()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main ContentView")
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
