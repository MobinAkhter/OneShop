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
    @State var list = [Product]()
    var body: some View {
      
        VStack{
            Text("Shopping Cart")
                .font(.callout)
            List{
                ForEach(self.list,id: \.id){ currentProduct in
                    Text("Product: \(currentProduct.productName)")
                    Text("Category: \(currentProduct.category)")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                }//for each
                .onDelete(perform: {indexSet in
                    self.list.remove(atOffsets: indexSet)
                })
                  
            }
        }//Vstack
        .onAppear{
            print("Count: \(theList.count)")
            list = theList
        }
        .onDisappear{
            list = theList
        }
    }
    
    
//    func getProducts(productName: String, category: String){
//      let product = Product(productName: productName, category: category)
//        self.productList.append(product)
//    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}

