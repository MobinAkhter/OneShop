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
    @State private var alertMessage = ""
    @State private var activate: Bool = false
    
    var body: some View {
        NavigationView{
        
        ZStack{
         
            NavigationLink(destination: ShoppingCart(theList: addProducts), tag: 1, selection: $cartTag){}
        
            Text("Categories")
                .font(.title2)
            List{
                Section(header: Text("Electonics")){
                    
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Electronics"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                
                Section(header: Text("Food & Drinks")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Food & Drinks"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 2
                
                Section(header: Text("Health")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Health"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 3
                
                Section(header: Text("Human Attire")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Human Attire"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 4
                
                Section(header: Text("Entertainment")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Entertainment"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 5
                
                Section(header: Text("School Supplies")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "School Supplies"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 6
                
                Section(header: Text("Household Items")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        if(currentItem.category == "Household Items"){
                            VStack(alignment: .leading){
                                Text("\(currentItem.productName)")
                                    .fontWeight(.bold)
                                    
                                Text("Tap to Add to Cart")
                                    .font(.callout)
                                    .italic()

                                Spacer()
                            }.padding(20)
                        .onTapGesture{
                            getProducts(productName: currentItem.productName, category: currentItem.category)
                            print("Selected \(currentItem.productName)")
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
                }//section 7
            }
          }
        }
        .onAppear(){
            self.loadProducts()
        }
        
        .toolbar{
            Button(action: {
                self.cartTag = 1
            }){
                Text("View Shopping Cart")
            }
        }
        
    }
    
    private func getProducts(productName: String, category: String){
      let product = Product(productName: productName, category: category)

       self.coreDBHelper.insertProduct(newProduct: Product1(productName: productName, category: category))
        
        self.addProducts.append(product)
        print(self.addProducts.count)
       
    }
    
    private func loadProducts(){
        //declaring electronics
        let tv = Product(productName: "Sony 43-Inch Bravia TV", category: "Electronics")
        let phone = Product(productName: "iPhone 13", category: "Electronics")
        let laptops = Product(productName: "MacBook Air 13-Inch", category: "Electronics")
        let ps5 = Product(productName: "PS5", category: "Electronics")
        let xbox = Product(productName: "Xbox Series X", category: "Electronics")
        let ninSwitch = Product(productName: "Nintendo Switch", category: "Electronics")
        let headphones = Product(productName: "AirPods Max", category: "Electronics")
        let pc = Product(productName: "Razer PC", category: "Electronics")
        let pcParts = Product(productName: "8GB Samsung RAM", category: "Electronics")
        
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
        let healthy = Product(productName: "Fuji Apple", category: "Food & Drinks")
        let water = Product(productName: "Aquafina Water Bottle 500ML", category: "Food & Drinks")
        let juice = Product(productName: "Tropicana Real Fruit Juice", category: "Food & Drinks")
        let soda = Product(productName: "Club Soda", category: "Food & Drinks")
        let fast = Product(productName: "Burger Patty", category: "Food & Drinks")
        let candy = Product(productName: "Dairy Milk Fruit & Nut", category: "Food & Drinks")
        let snack = Product(productName: "BBQ Chips", category: "Food & Drinks")
        let meat = Product(productName: "Pork", category: "Food & Drinks")
        let frozen = Product(productName: "Frozen Meat", category: "Food & Drinks")
        
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
        let medicine = Product(productName: "Tylenol", category: "Health")
        let soap = Product(productName: "Dove Soap", category: "Health")
        let shampoo = Product(productName: "Head & Shoulders Shampoo", category: "Health")
        let ditergent = Product(productName: "Tide Detergent", category: "Health")
        let toiletPaper = Product(productName: "Toilet Paper", category: "Health")
        let brush = Product(productName: "Tooth Brush", category: "Health")
        let skinCare = Product(productName: "Vaseline Hand Cream", category: "Health")
        let shave = Product(productName: "Philips Shaving Kit", category: "Health")
        let healthProducts = Product(productName: "Trimmer", category: "Health")
        let toothPaste = Product(productName: "Colgate Tooth Paste", category: "Health")
        
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
        let shirts = Product(productName: "Levis Shirt Size Medium", category: "Human Attire")
        let pants = Product(productName: "Levis Pants W:32 H:30", category: "Human Attire")
        let shoes = Product(productName: "Nike AF1", category: "Human Attire")
        let socks = Product(productName: "Nike Socks", category: "Human Attire")
        let makeUp = Product(productName: "Maybelline Colossal Kajal", category: "Human Attire")
        let suits = Product(productName: "Men's Formal Suit Size: Medium", category: "Human Attire")
        let jewellery = Product(productName: "Necklace", category: "Human Attire")
        let jackets = Product(productName: "Levis Leather Jacket", category: "Human Attire")
        let hats = Product(productName: "Champion Hat", category: "Human Attire")
        let glasses = Product(productName: "Ray-Ban Sunglasses", category: "Human Attire")
    
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
        let movies = Product(productName: "The Founder - DVD", category: "Entertainment")
        let games  = Product(productName: "Spiderman Miles Morales - PS5", category: "Entertainment")
        let toys = Product(productName: "Hotwheels - Pack of 1", category: "Entertainment")
        let sports = Product(productName: "Bike Helmet", category: "Entertainment")
        let bike = Product(productName: "GT Bike", category: "Entertainment")
    
        self.productList.append(movies)
        self.productList.append(games)
        self.productList.append(toys)
        self.productList.append(sports)
        self.productList.append(bike)
       
        
        //declaring school products
        let books = Product(productName: "The Fault in our Stars - Hardcover", category: "School Supplies")
        let noteBooks = Product(productName: "A4 Notebook", category: "School Supplies")
        let bags = Product(productName: "School Bag", category: "School Supplies")
        let pencils = Product(productName: "Pencil", category: "School Supplies")
        let pens = Product(productName: "Pen", category: "School Supplies")
        let erasers = Product(productName: "Eraser", category: "School Supplies")
        let markers = Product(productName: "Marker", category: "School Supplies")
        let crayons = Product(productName: "Crayon", category: "School Supplies")
        let poster = Product(productName: "Poster Board", category: "School Supplies")
        let calculator = Product(productName: "Calculator", category: "School Supplies")
        let sharpeners = Product(productName: "Sharpener", category: "School Supplies")
        
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
        let furniture = Product(productName: "Study Table", category: "Household Items")
        let plants = Product(productName: "Money Plant", category: "Household Items")
        let kitchen = Product(productName: "Silverware", category: "Household Items")
        let towels = Product(productName: "Hand Towel", category: "Household Items")
        let beds = Product(productName: "Bed Frame - White", category: "Household Items")
    
        self.productList.append(furniture)
        self.productList.append(plants)
        self.productList.append(kitchen)
        self.productList.append(towels)
        self.productList.append(beds)
        
    }
}



struct CustomRowView : View{
    var product : Product
    
    var body: some View{
    VStack(alignment: .leading){
        Text("\(product.productName)")
            .fontWeight(.bold)
            
        Text("Tap to Add to Cart")
            .font(.callout)
            .italic()

        Spacer()
    }.padding(20)
        
    }
}



