//
//  Product.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-22.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Hashable, Codable{
    @DocumentID var id : String? = UUID().uuidString
    var productName : String = ""
    var category : String = ""
    
    init(){
        
    }
    
    init(productName: String, category: String){
        self.productName = productName
        self.category = category
    }
    
    init?(dictionary: [String : Any]){
        guard let productName = dictionary["productName"] as? String else{
            return nil
        }
        
        guard let category = dictionary["category"] as? String else{
            return nil
        }
        
        self.init(productName: productName, category: category)
    }
}
