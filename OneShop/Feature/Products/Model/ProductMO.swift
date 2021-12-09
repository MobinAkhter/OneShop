//  Student Name: Jatin Sharma | Student ID: 991417968


import Foundation
import CoreData

@objc(ProductMO)
final class ProductMO: NSManagedObject{
    
    @NSManaged var id : UUID
    @NSManaged var productName : String
    @NSManaged var category : String
    @NSManaged var dateAdded: Date

}

extension ProductMO{
    
    func converToProduct() -> Product1{
        Product1(productName: productName, category: category)
    }
}
