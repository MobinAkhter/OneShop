//
//  ProductSelection.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-20.
//

import SwiftUI
import CoreData

struct ProductSelection: View {
    
   
    @State private var selected: Int = 1
    @State private var productList = [Product]()
    @State private var addProducts = [Product]()
    @State private var cartTag : Int? = nil
    @EnvironmentObject var coreDBHelper: CoreDBHelper
    var numberOfQuantity = ["1","2","3","4","5","6","7","8","9","10"]
    @State private var alertMessage = ""
    @State private var activate: Bool = false
    @State private var quantity = ["","","","","","","","",""]
    //@State private var quantity : String = ""
    @EnvironmentObject var sessionService: SessionServiceImpl

    
    var body: some View {
        NavigationView{
        ZStack{
         
            NavigationLink(destination: ShoppingCart(theList: addProducts), tag: 1, selection: $cartTag){}
            List{
                Section(header: Text("Electonics")){
                    
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Electronics"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                
                                Text("$\(currentItem.price, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                
                                Picker("Please choose quantity", selection: $quantity[indx]) {
                                    ForEach(numberOfQuantity, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                                
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()
                                
                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            
                            var a : String = ""
                            a = self.quantity[indx]
                           
                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price, quantity: a)
                         
                            self.activate = true
                        }
                            .alert(isPresented: self.$activate){
                            Alert(
                                title: Text("Success"),
                                message: Text("Product Added to Cart!"),
                                dismissButton: .default(Text("Done"))
                            )
                        }//alert
                        }
                    }
                }//section 1
                
//                Section(header: Text("Food & Drinks")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "Food & Drinks"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//                              Text("Indx: \(indx)")
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 2
//
//                Section(header: Text("Health")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "Health"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 3
//
//                Section(header: Text("Human Attire")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "Human Attire"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 4
//
//                Section(header: Text("Entertainment")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "Entertainment"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 5
//
//                Section(header: Text("School Supplies")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "School Supplies"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 6
//
//                Section(header: Text("Household Items")){
//                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
//                        if(currentItem.category == "Household Items"){
//                            VStack(alignment: .leading){
//                                Text("\(currentItem.productName)")
//                                    .fontWeight(.bold)
//                                Text("$\(currentItem.price, specifier: "%.2f")")
//                                    .fontWeight(.bold)
//                                Text("Tap to Add to Cart")
//                                    .font(.callout)
//                                    .italic()
//
//                                Spacer()
//                            }.padding(20)
//                        .onTapGesture{
//                            getProducts(productName: currentItem.productName, category: currentItem.category, price: currentItem.price)
//                            print("Selected \(currentItem.productName)")
//                            self.activate = true
//                        }
//                            .alert(isPresented: self.$activate){
//                            Alert(
//                                title: Text("Success"),
//                                message: Text("Product Added to Cart!"),
//                                dismissButton: .default(Text("Done"))
//                            )
//                        }//alert
//
//
//                        }
//                    }
//                }//section 7
            }
          }
        }
        .onAppear(){
            self.loadProducts()
        }
        
//        .toolbar{
//            Button(action: {
//                self.cartTag = 1
//            }){
//                Text("View Shopping Cart")
//            }
//        }
        
    }
    
    private func getProducts(productName: String, category: String,price:Double, quantity: String){
        
        let product = Product(productName: productName, category: category,price:price)
        var emailId = sessionService.userDetails?.email
        let removeCharacters: Set<Character> = ["(", ")","O","p","t","i","o","n","a","l"]
        emailId?.removeAll(where: { removeCharacters.contains($0) } )
        var a = Double(quantity) ?? 0.0
        print("****************")
        print("Let's See what we got: \(a)")
        self.coreDBHelper.insertProduct(newProduct: Product1(productName: productName, category: category, price: price,email:emailId ?? "",quantity: a))
        self.addProducts.append(product)
        print(self.addProducts.count)
       
    }
    
    private func loadProducts(){
        
 
        //declaring electronics
        let tv = Product(productName: "Sony 43-Inch Bravia TV", category: "Electronics", price: 1300.00)
        let phone = Product(productName: "iPhone 13", category: "Electronics", price: 1800.00)
        let laptops = Product(productName: "MacBook Air 13-Inch", category: "Electronics", price: 2000.00)
        let ps5 = Product(productName: "PS5", category: "Electronics", price: 800.99)
        let xbox = Product(productName: "Xbox Series X", category: "Electronics", price: 600.99)
        let ninSwitch = Product(productName: "Nintendo Switch", category: "Electronics", price: 450.99)
        let headphones = Product(productName: "AirPods Max", category: "Electronics", price: 800.99)
        let pc = Product(productName: "Razer PC", category: "Electronics", price: 1300.99)
        let pcParts = Product(productName: "8GB Samsung RAM", category: "Electronics", price: 80.99)
        
        self.productList.append(tv)
        self.productList.append(phone)
        self.productList.append(laptops)
        self.productList.append(ps5)
        self.productList.append(xbox)
        self.productList.append(ninSwitch)
        self.productList.append(headphones)
        self.productList.append(pc)
        self.productList.append(pcParts)
        
        
        
        //delcaring food & drinks
        let healthy = Product(productName: "Fuji Apple", category: "Food & Drinks", price: 10.00)
        let water = Product(productName: "Aquafina Water Bottle 500ML", category: "Food & Drinks", price: 5.00)
        let juice = Product(productName: "Tropicana Real Fruit Juice", category: "Food & Drinks", price: 2.00)
        let soda = Product(productName: "Club Soda", category: "Food & Drinks", price: 1.00)
        let fast = Product(productName: "Burger Patty", category: "Food & Drinks", price: 3.50)
        let candy = Product(productName: "Dairy Milk Fruit & Nut", category: "Food & Drinks", price: 1.50)
        let snack = Product(productName: "BBQ Chips", category: "Food & Drinks", price: 2.00)
        let meat = Product(productName: "Pork", category: "Food & Drinks", price: 13.00)
        let frozen = Product(productName: "Frozen Meat", category: "Food & Drinks", price: 13.99)
        
        self.productList.append(healthy)
        self.productList.append(water)
        self.productList.append(juice)
        self.productList.append(soda)
        self.productList.append(fast)
        self.productList.append(candy)
        self.productList.append(snack)
        self.productList.append(meat)
        self.productList.append(frozen)
        
        //declaring health
        let medicine = Product(productName: "Tylenol", category: "Health", price: 3.99)
        let soap = Product(productName: "Dove Soap", category: "Health", price: 2.99)
        let shampoo = Product(productName: "Head & Shoulders Shampoo", category: "Health", price: 7.99)
        let ditergent = Product(productName: "Tide Detergent", category: "Health", price: 5.99)
        let toiletPaper = Product(productName: "Toilet Paper", category: "Health", price: 2.99)
        let brush = Product(productName: "Tooth Brush", category: "Health", price: 2.99)
        let skinCare = Product(productName: "Vaseline Hand Cream", category: "Health", price: 3.99)
        let shave = Product(productName: "Philips Shaving Kit", category: "Health", price: 25.99)
        let healthProducts = Product(productName: "Trimmer", category: "Health", price: 10.99)
        let toothPaste = Product(productName: "Colgate Tooth Paste", category: "Health", price: 3.99)
        
        self.productList.append(medicine)
        self.productList.append(soap)
        self.productList.append(shampoo)
        self.productList.append(ditergent)
        self.productList.append(toiletPaper)
        self.productList.append(brush)
        self.productList.append(skinCare)
        self.productList.append(shave)
        self.productList.append(healthProducts)
        self.productList.append(toothPaste)
        
        
        //declaring attire
        let shirts = Product(productName: "Levis Shirt Size Medium", category: "Human Attire", price: 13.99)
        let pants = Product(productName: "Levis Pants W:32 H:30", category: "Human Attire", price: 20.99)
        let shoes = Product(productName: "Nike AF1", category: "Human Attire", price: 130.99)
        let socks = Product(productName: "Nike Socks", category: "Human Attire", price: 13.99)
        let makeUp = Product(productName: "Maybelline Colossal Kajal", category: "Human Attire", price: 5.99)
        let suits = Product(productName: "Men's Formal Suit Size: Medium", category: "Human Attire", price: 130.99)
        let jewellery = Product(productName: "Necklace", category: "Human Attire", price: 1300.99)
        let jackets = Product(productName: "Levis Leather Jacket", category: "Human Attire", price: 130.99)
        let hats = Product(productName: "Champion Hat", category: "Human Attire", price: 13.99)
        let glasses = Product(productName: "Ray-Ban Sunglasses", category: "Human Attire", price: 200.99)
    
        self.productList.append(shirts)
        self.productList.append(pants)
        self.productList.append(shoes)
        self.productList.append(socks)
        self.productList.append(makeUp)
        self.productList.append(suits)
        self.productList.append(jewellery)
        self.productList.append(jackets)
        self.productList.append(hats)
        self.productList.append(glasses)
        
        //declaring entertainment
        let movies = Product(productName: "The Founder - DVD", category: "Entertainment", price: 5.50)
        let games  = Product(productName: "Spiderman Miles Morales - PS5", category: "Entertainment", price: 30.99)
        let toys = Product(productName: "Hotwheels - Pack of 1", category: "Entertainment", price: 1.99)
        let sports = Product(productName: "Bike Helmet", category: "Entertainment", price: 130.99)
        let bike = Product(productName: "GT Bike", category: "Entertainment", price: 600.99)
    
        self.productList.append(movies)
        self.productList.append(games)
        self.productList.append(toys)
        self.productList.append(sports)
        self.productList.append(bike)
       
        
        //declaring school products
        let books = Product(productName: "The Fault in our Stars - Hardcover", category: "School Supplies", price: 13.99)
        let noteBooks = Product(productName: "A4 Notebook", category: "School Supplies", price: 5.99)
        let bags = Product(productName: "School Bag", category: "School Supplies", price: 15.99)
        let pencils = Product(productName: "Pencil", category: "School Supplies", price: 1.99)
        let pens = Product(productName: "Pen", category: "School Supplies", price: 1.99)
        let erasers = Product(productName: "Eraser", category: "School Supplies", price: 0.99)
        let markers = Product(productName: "Marker", category: "School Supplies", price: 1.99)
        let crayons = Product(productName: "Crayon", category: "School Supplies", price: 0.99)
        let poster = Product(productName: "Poster Board", category: "School Supplies", price: 5.99)
        let calculator = Product(productName: "Calculator", category: "School Supplies", price: 13.99)
        let sharpeners = Product(productName: "Sharpener", category: "School Supplies", price: 1.99)
        
        self.productList.append(books)
        self.productList.append(noteBooks)
        self.productList.append(bags)
        self.productList.append(pencils)
        self.productList.append(pens)
        self.productList.append(erasers)
        self.productList.append(markers)
        self.productList.append(crayons)
        self.productList.append(poster)
        self.productList.append(calculator)
        self.productList.append(sharpeners)
        
        //delcaring household items
        let furniture = Product(productName: "Study Table", category: "Household Items", price: 100.99)
        let plants = Product(productName: "Money Plant", category: "Household Items", price: 15.99)
        let kitchen = Product(productName: "Silverware", category: "Household Items", price: 5.99)
        let towels = Product(productName: "Hand Towel", category: "Household Items", price: 1.99)
        let beds = Product(productName: "Bed Frame - White", category: "Household Items", price: 500.99)
    
        self.productList.append(furniture)
        self.productList.append(plants)
        self.productList.append(kitchen)
        self.productList.append(towels)
        self.productList.append(beds)
        
    }
}




