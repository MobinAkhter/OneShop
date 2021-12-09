//
//  Product1.swift
//  OneShop
//
//  Created by Jatin Sharma on 2021-12-09.
//

import Foundation


class Product1: ObservableObject{
    
    var id = UUID()
    var productName : String = ""
    var category : String = ""
    var price: Double = 0.0
    
    init(){
        
    }
    
    init(productName: String, category: String, price: Double){
        self.productName = productName
        self.category = category
        self.price = price
    }
    
   
}


