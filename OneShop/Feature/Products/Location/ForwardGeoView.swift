//
//  ForwardGeoView.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-12-04.
//

import SwiftUI
import CoreLocation

struct ForwardGeoView: View {
    @State private var street: String = ""
    @State private var city : String = ""
    @State private var country: String = ""
    @State private var result : String = ""
    @ObservedObject var locationHelper = LocationHelper()
    @State private var obtainedCoordinates: CLLocation?
    
    var body: some View {
        VStack{
            Text("Enter Your Coordinates")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Form{
                TextField("Enter Your Street", text: $street)
                
                TextField("Enter Your City", text: $city)
                
                TextField("Enter Your Country", text: $country)
            }
            
            Text("\(self.result)")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Text("Enter these coordinates to your phone")
            
            Button(action: {
                let address = "\(self.street), \(self.city), \(self.country)"
            }){
                Text("Enter")
            }
            
            Spacer()

        }
    }
    
    private func performGeocoding(address: String){
        print(#function, "Performing geocoding on the address: \(address)")
        
        self.locationHelper.doForwardGeocoding(address: address, completionHandler: {(coordinates, error) in
            
            if (error == nil && coordinates != nil){
                self.obtainedCoordinates = coordinates!
                
                self.result = "The latititude is \(coordinates!.coordinate.latitude) \n The longitude is : \(coordinates!.coordinate.longitude)"
                
                
            }else{
                self.result = "Unable to get the coordinates for given address"
            }
        })
    }
}

struct ForwardGeoView_Previews: PreviewProvider {
    static var previews: some View {
        ForwardGeoView()
    }
}
