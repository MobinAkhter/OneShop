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
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
                        }
                    }
                }//section 2
                
                Section(header: Text("Health")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        
                        if(currentItem.category == "Health"){
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
                        }
                    }
                }//section 3
                
                Section(header: Text("Human Attire")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        
                        if(currentItem.category == "Human Attire"){
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
                        }
                    }
                }//section 4
                
                Section(header: Text("Entertainment")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        
                        if(currentItem.category == "Entertainment"){
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
                            
                        }
                    }
                }//section 5
                
                Section(header: Text("School Supplies")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        
                        if(currentItem.category == "School Supplies"){
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
                        }
                    }
                }//section 6
                
                Section(header: Text("Household Items")){
                    ForEach(self.productList.enumerated().map({$0}), id: \.element.self){indx, currentItem in
                        
                        if(currentItem.category == "Household Items"){
                            CustomRowView(product: currentItem)
                                 .onTapGesture{
                                     getProducts(productName: currentItem.productName, category: currentItem.category)
                                     print("Selected \(currentItem.productName)")
                                 }
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
        let tv = Product(productName: "TV", category: "Electronics")
        let phone = Product(productName: "Phones", category: "Electronics")
        let laptops = Product(productName: "Laptops", category: "Electronics")
        let ps5 = Product(productName: "PS5", category: "Electronics")
        let xbox = Product(productName: "Xbox Series X", category: "Electronics")
        let ninSwitch = Product(productName: "Nintendo Switch", category: "Electronics")
        let headphones = Product(productName: "Head Phones", category: "Electronics")
        let pc = Product(productName: "PCs", category: "Electronics")
        let pcParts = Product(productName: "Computer Parts", category: "Electronics")
        
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
        let healthy = Product(productName: "Fruits & Vegetbales", category: "Food & Drinks")
        let water = Product(productName: "Water", category: "Food & Drinks")
        let juice = Product(productName: "Juice", category: "Food & Drinks")
        let soda = Product(productName: "Soda", category: "Food & Drinks")
        let fast = Product(productName: "Fast Food", category: "Food & Drinks")
        let candy = Product(productName: "Candy & Chocolate", category: "Food & Drinks")
        let snack = Product(productName: "Snacks", category: "Food & Drinks")
        let meat = Product(productName: "Meat", category: "Food & Drinks")
        let frozen = Product(productName: "Frozen Food", category: "Food & Drinks")
        
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
        let medicine = Product(productName: "Medicine", category: "Health")
        let soap = Product(productName: "Soap", category: "Health")
        let shampoo = Product(productName: "Shampoo", category: "Health")
        let ditergent = Product(productName: "Ditergent", category: "Health")
        let toiletPaper = Product(productName: "Toilet Paper", category: "Health")
        let brush = Product(productName: "Tooth Brush", category: "Health")
        let skinCare = Product(productName: "Skin Care Products", category: "Health")
        let shave = Product(productName: "Shaving Kit", category: "Health")
        let healthProducts = Product(productName: "Health Products", category: "Health")
        let toothPaste = Product(productName: "Tooth Paste", category: "Health")
        
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
        let shirts = Product(productName: "Shirts", category: "Human Attire")
        let pants = Product(productName: "Pants", category: "Human Attire")
        let shoes = Product(productName: "Shoes", category: "Human Attire")
        let socks = Product(productName: "Socks", category: "Human Attire")
        let makeUp = Product(productName: "Make Up Gear", category: "Human Attire")
        let suits = Product(productName: "Suits", category: "Human Attire")
        let jewellery = Product(productName: "Jewellery", category: "Human Attire")
        let jackets = Product(productName: "Jackets", category: "Human Attire")
        let hats = Product(productName: "Hats", category: "Human Attire")
        let glasses = Product(productName: "Glasses", category: "Human Attire")
    
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
        let movies = Product(productName: "Movies", category: "Entertainment")
        let games  = Product(productName: "Video Games", category: "Entertainment")
        let toys = Product(productName: "Toys", category: "Entertainment")
        let sports = Product(productName: "Sports Gear", category: "Entertainment")
        let bike = Product(productName: "Bicycles", category: "Entertainment")
    
        self.productList.append(movies)
        self.productList.append(games)
        self.productList.append(toys)
        self.productList.append(sports)
        self.productList.append(bike)
       
        
        //declaring school products
        let books = Product(productName: "Books", category: "School Supplies")
        let noteBooks = Product(productName: "Note Books", category: "School Supplies")
        let bags = Product(productName: "Bags", category: "School Supplies")
        let pencils = Product(productName: "Pencils", category: "School Supplies")
        let pens = Product(productName: "Pens", category: "School Supplies")
        let erasers = Product(productName: "Erasers", category: "School Supplies")
        let markers = Product(productName: "Markers", category: "School Supplies")
        let crayons = Product(productName: "Crayons", category: "School Supplies")
        let poster = Product(productName: "Poster Boards", category: "School Supplies")
        let calculator = Product(productName: "Calculators", category: "School Supplies")
        let sharpeners = Product(productName: "Sharpeners", category: "School Supplies")
        
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
        let furniture = Product(productName: "Furniture", category: "Household Items")
        let plants = Product(productName: "Plants", category: "Household Items")
        let kitchen = Product(productName: "Kitchen Items (Utensils, Fridges)", category: "Household Items")
        let towels = Product(productName: "Towels", category: "Household Items")
        let beds = Product(productName: "Beds", category: "Household Items")
    
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



