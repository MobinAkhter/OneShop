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
    @State private var lat : Double = 0.0
    @State private var lng : Double = 0.0
    @ObservedObject var locationHelper = LocationHelper()
    @State private var mapViewTag: Int? = nil
    @State private var obtainedCoordinates: CLLocation?
     
    
    var body: some View {
        VStack{
            NavigationLink(destination: MapView(locationHelper: locationHelper, theLat: self.lat, theLng: self.lng),tag: 1, selection: $mapViewTag  ){}
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
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Text("Enter these coordinates to your phone")
            
            Button(action: {
                let address = "\(self.street), \(self.city), \(self.country)"
                self.performGeocoding(address: address)
            }){
                Text("Enter")
            }
            
            Button(action:{
                self.mapViewTag = 1
                print("Value is \(self.$mapViewTag)")
             
            }){
                Text("Click Here To View Map")
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
                
                self.lat = self.obtainedCoordinates?.coordinate.latitude ?? 34.2323
                self.lng = self.obtainedCoordinates?.coordinate.longitude ?? -45.3432
                let mapView = MyMap(location: (self.obtainedCoordinates)!)
                mapView.getCoors(lat: self.lat, lng: self.lng)
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

