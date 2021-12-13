//
//  ShoppingCart.swift
//  OneShop
//
//  Created by Jatin Sharma on 2021-12-09.
//

import SwiftUI

struct ShoppingCart: View {

    @EnvironmentObject var coreDBHelper : CoreDBHelper
    @State var list = [Product]()
    @State var total : Double = 0.0
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State var emailId : String = ""

    var body: some View {
        
        Text(" Your Shopping Cart")
            .fontWeight(.bold)
            .font(.title)
            .padding()
        ZStack{
            
            if (self.coreDBHelper.productList.count > 0){
               
                List{
                    ForEach (self.coreDBHelper.productList.enumerated().map({$0}), id: \.element.self){ indx, currentReservation in
                        if(currentReservation.email == emailId){
                            VStack(alignment: .leading){
                                Text("\(currentReservation.productName)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    
                                
                                Text("Price: $\(currentReservation.price, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                                
                                Text("Quantity: \(currentReservation.quantity, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)

                            }.padding(20)
                    }
                    }//ForEach
                    .onDelete(perform: {indexSet in
                        
                        for index in indexSet{
                            //ask for confirmation and then delete
                            self.coreDBHelper.deleteProduct(reservationID: self.coreDBHelper.productList[index].id)
                            self.coreDBHelper.productList.remove(atOffsets: indexSet)
                        }
                        total=0.0
                        for word in self.coreDBHelper.productList{
                            
                            total+=word.price
                        }
                    })
                    VStack{
                        Text("Total: $\(self.total, specifier: "%.2f")")
                            .foregroundColor(.black)
                        .fontWeight(.bold)}

                }
                
            
        }
       
        }
        .onAppear(){
           emailId = sessionService.userDetails?.email ?? ""
            let removeCharacters: Set<Character> = ["(", ")","O","p","t","i","o","n","a","l"]
            emailId.removeAll(where: { removeCharacters.contains($0) } )
            self.coreDBHelper.getAllProducts()
            for word in self.coreDBHelper.productList{
                
                total+=word.price
            }
          
        }
        .onDisappear{
        }
    }
      
    

}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}

