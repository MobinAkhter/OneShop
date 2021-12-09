//  Student Name: Jatin Sharma | Student ID: 991417968


import Foundation
import CoreData

class CoreDBHelper : ObservableObject{

    @Published var productList = [ProductMO]()
    
    private let ENTITY_NAME = "ProductMO"
    private let MOC : NSManagedObjectContext

    private static var shared: CoreDBHelper?

    static func getInstance() -> CoreDBHelper{
        if shared == nil{
            shared = CoreDBHelper(context: PersistenceController.preview.container.viewContext)
        }
        return shared!
    }
    init(context: NSManagedObjectContext) {
        self.MOC = context
    }
    
    func insertProduct(newProduct: Product1){
        do{
            
            //1. obtain the object reference of NSEntityDescription
            let productTobeInserted = NSEntityDescription.insertNewObject(forEntityName: self.ENTITY_NAME, into: self.MOC) as! ProductMO
            
            //2. assign values to be inserted to the object reference
            productTobeInserted.id = UUID()
            productTobeInserted.productName = newProduct.productName
            productTobeInserted.category = newProduct.category
            productTobeInserted.dateAdded = Date()

            
            //3. save the object to the db
            if self.MOC.hasChanges{
                try self.MOC.save()
                print(#function, "Product successfully added to DB")
            }
            
        }catch let error as NSError{
            print(#function, "Could not insert reservation successfully \(error)")
        }
    }
    
    func getAllProducts(){
        let fetchRequest = NSFetchRequest<ProductMO>(entityName: self.ENTITY_NAME)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "dateAdded", ascending: false)]
        
        do{
            let result = try self.MOC.fetch(fetchRequest)
            print(#function, "Number of records fetched : \(result.count)")
            self.productList.removeAll()
            self.productList.insert(contentsOf: result, at: 0)
            print(#function, "Result from DB \(result)")
            
        }catch let error as NSError{
            print(#function, "Couldn't fetch data from DB \(error)")
        }
    }
    
    func deleteProduct(reservationID : UUID){
        let searchResult = self.searchProduct(reservationID: reservationID)
        
        if (searchResult != nil){
            //if matching object found
            
            do{
                
                self.MOC.delete(searchResult!)
                
                try self.MOC.save()
                
                print(#function, "Data deleted successfully")
                
            }catch let error as NSError{
                print(#function, "Unable to search for given ID \(error)")
            }
            
        }else{
            print(#function, "No matching record found for given bookID \(reservationID)")
        }
    }
    
    private func searchProduct(reservationID : UUID) -> ProductMO?{
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        let predicateID = NSPredicate(format: "id == %@", reservationID as CVarArg)
        //        let predicateID = NSPredicate(format: "title == %@", bookTitle as CVarArg)
        fetchRequest.predicate = predicateID
        
        do{
            let result = try self.MOC.fetch(fetchRequest)
            
            if result.count > 0{
                return result.first as? ProductMO
            }
            
        }catch let error as NSError{
            print(#function, "Unable to search for given ID \(error)")
        }
        
        return nil
    }
}
