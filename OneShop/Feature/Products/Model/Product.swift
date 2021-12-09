//
//  Product.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-22.
//

import Foundation


struct Product: Identifiable, Hashable{
    var id = UUID()
    var productName : String = ""
    var category : String = ""
    var price : Double = 0.0

    
    init(){
        
    }
    
    init(productName: String, category: String, price: Double){
        self.productName = productName
        self.category = category
        self.price = price
      
    }
    
   
}


