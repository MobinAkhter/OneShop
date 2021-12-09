//
//  ShoppingCart.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-27.
//

import SwiftUI

struct ShoppingCart: View {
   // var product = ProductSelection()
   @State var theList = [Product]()
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    @State var list = [Product]()
    var body: some View {
      
        ZStack{
  
            if (self.coreDBHelper.productList.count > 0){
                List{
                    ForEach (self.coreDBHelper.productList.enumerated().map({$0}), id: \.element.self){ indx, currentReservation in
        
                            
                            VStack(alignment: .leading){
                                Text("Name: \(currentReservation.productName)")
                                    .fontWeight(.bold)
                                
                                Text("Category: \(currentReservation.category)")
                                    .fontWeight(.bold)

                            }.padding(20)
                        
                    }//ForEach
                    .onDelete(perform: {indexSet in
                        
                        for index in indexSet{
                            //ask for confirmation and then delete
                            self.coreDBHelper.deleteProduct(reservationID: self.coreDBHelper.productList[index].id)
                            self.coreDBHelper.productList.remove(atOffsets: indexSet)
                        }
                    })
                    
                }
            
        }
       
        }
        .onAppear(){
            self.coreDBHelper.getAllProducts()
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

