//
//  Product.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-22.
//

import Foundation


struct Product: Hashable{
    var id = UUID()
    var productName : String = ""
    var category : String = ""
    
    init(){
        
    }
    
    init(productName: String, category: String){
        self.productName = productName
        self.category = category
    }
    
   
}

