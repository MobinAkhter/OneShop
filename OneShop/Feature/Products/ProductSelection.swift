//
//  ProductSelection.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-11-20.
//

import SwiftUI

struct ProductSelection: View {
    
    @State private var selectedElectronic = Electronics.Phones.rawValue
    @State private var selectedFoodDrinks = FoodDrinks.Healthy.rawValue
    @State private var selected: Int = 1
    
  
    enum Electronics: String, CaseIterable{
        case TV = "TV"
        case Phones = "Phones"
        case Laptops = "Laptops"
        case PS5 = "PS5"
        case Xbox = "Xbox Series X"
        case Switch = "Nintendo Switch"
        case Headphones = "Headphones"
        case PCs = "PCs"
    }
    
    enum FoodDrinks: String, CaseIterable{
        case Healthy = "Fruits & Vegetables"
        case Water = "Water"
        case Juice = "Juice"
        case Soda = "Soda"
        case FastFood = "Fast Food"
        case Sugar = " Candy & Chocolate"
        case Snack = "Snacks"
        case Meat = "Meat"
    }
    
    enum Health: String, CaseIterable{
        case Medicine = "Medicine"
        case Soap = "Soap"
        case Shampoo = "Shampoo"
        case Ditergent = "Ditergent"
        case ToiletPaper = "Toilet Paper"
        case ToothBrush = "Tooth Brush"
        case SkinCare = "Skin Care Products"
        case Shave = "Shaving Kit"
        case HealthProducts = "Health Products"
        case ToothPaste = "Tooth Paste"
    }
    
    enum Attire: String, CaseIterable{
        case Shirts = "Shirts"
        case Pants = "Pants"
        case Sweater = "Sweaters"
        case Shoes = "Shoes"
        case Socks = "Socks"
        case MakeUp = "Make Up Gear"
        case Suit = "Suits"
        case Jewls = "Jewellery"
        case Jacket = "Jackets"
        case Hat = "Hats"
        case Glasses = "Glasses"
    }
    
    enum Entertainment: String, CaseIterable{
        case Movies = "Movies"
        case Games = "Video Games"
        case Toys = "Toys"
        case Sport = "Sports Gear"
        case Bike = "Bicycles"
    }
    
    enum School: String , CaseIterable{
        case Books = "Books"
        case NoteBook = "NoteBooks"
        case Bags = "Bags"
        case Pencils = "Pencils"
        case Pens = "Pens"
        case Eraser = "Eraser"
        case Markers = "Markers"
        case Crayons = "Crayons"
        case Poster = "Poster Boards"
        case Caclulator = "Calculators"
        case Sharpeners = "Sharpeners"
    }
    
    enum HouseHold : String, CaseIterable{
        case Furniture = "Furniture"
        case Plants = "Plants"
        case Kitchen = "Kitchen Items (Utensils, Fridges)"
        case Towels = "Towels"
        case Bed = "Beds"
        
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Select Items (Item selected will be added to your cart)")
                .font(.title)
            Text("Categories")
                .font(.largeTitle)
            Group{
            Text("Electronics")
                .font(.title3)
           
            //Picker for electronics
            Picker("Electronics", selection: $selectedElectronic){
                Text("TV").tag(Electronics.TV.rawValue)
                Text("Phones").tag(Electronics.Phones.rawValue)
                Text("Laptops").tag(Electronics.Laptops.rawValue)
                Text("PS5").tag(Electronics.PS5.rawValue)
                Text("Xbox Series X").tag(Electronics.Xbox.rawValue)
                Text("Nintendo Switch").tag(Electronics.Switch.rawValue)
                Text("Headphones").tag(Electronics.Headphones.rawValue)
                Text("PCs").tag(Electronics.PCs.rawValue)
            }
            }
            
            Group{
            Text("Food & Drinks")
                .font(.title3)
            
            //Picker for food and drinks
            Picker("FoodDrinks", selection: $selectedElectronic){
                Text("Fruits & Vegetables").tag(FoodDrinks.Healthy.rawValue)
                Text("Water").tag(FoodDrinks.Water.rawValue)
                Text("Juice").tag(FoodDrinks.Juice.rawValue)
                Text("Soda").tag(FoodDrinks.Soda.rawValue)
                Text("Fast Food").tag(FoodDrinks.FastFood.rawValue)
                Text("Candy & Chocolate").tag(FoodDrinks.Sugar.rawValue)
                Text("Snacks").tag(FoodDrinks.Snack.rawValue)
                Text("Meat").tag(FoodDrinks.Meat.rawValue)
            }
            }
            Group{
            Text("Health")
                .font(.title3)
            
            //Picker for health
            Picker("Health", selection: $selectedElectronic){
                Text("Medicine").tag(Health.Medicine.rawValue)
                Text("Soap").tag(Health.Soap.rawValue)
                Text("Shampoo").tag(Health.Shampoo.rawValue)
                Text("Ditergent").tag(Health.Ditergent.rawValue)
                Text("Toilet Paper").tag(Health.ToiletPaper.rawValue)
                Text("Tooth Brush").tag(Health.ToothBrush.rawValue)
                Text("Tooth Paste").tag(Health.ToothPaste.rawValue)
                Text("Skin Care Products").tag(Health.SkinCare.rawValue)
                Text("Health Products").tag(Health.HealthProducts.rawValue)
                Text("Shaving Kit").tag(Health.Shave.rawValue)
                
            }
            }
            Group{
            
            Text("Human Attire and Cosmetics")
                .font(.title3)
            //Picker for attire
            Picker("Attire", selection: $selectedElectronic){
                Text("Shirts").tag(Attire.Shirts.rawValue)
                Text("Pants").tag(Attire.Pants.rawValue)
                Text("Sweaters").tag(Attire.Sweater.rawValue)
                Text("Shoes").tag(Attire.Shoes.rawValue)
                Text("Make Up Gear").tag(Attire.MakeUp.rawValue)
                Text("Suits").tag(Attire.Suit.rawValue)
                Text("Jewellery").tag(Attire.Jewls.rawValue)
                Text("Jackets").tag(Attire.Jacket.rawValue)
                Text("Hats").tag(Attire.Hat.rawValue)
                Text("Glasses").tag(Attire.Glasses.rawValue)
           
            }
            }
            Group{
            Text("Entertainment")
                .font(.title3)
            //Picker for entertainment
            Picker("Etnertainment", selection: $selectedElectronic){
                Text("Movies").tag(Entertainment.Movies.rawValue)
                Text("Video Games").tag(Entertainment.Games.rawValue)
                Text("Toys").tag(Entertainment.Toys.rawValue)
                Text("Sports Gear").tag(Entertainment.Sport.rawValue)
                Text("Bicycles").tag(Entertainment.Bike.rawValue)
           
            }
                
            }
            
            Group{
            Text("School Items")
                .font(.title3)
            
            //Picker for school items
            Picker("School", selection: $selectedElectronic){
                Group{
                Text("Books").tag(School.Books.rawValue)
                Text("Note Books").tag(School.NoteBook.rawValue)
                Text("Bags").tag(School.Bags.rawValue)
                Text("Pencils").tag(School.Pencils.rawValue)
                Text("Pens").tag(School.Pens.rawValue)
                Text("Eraser").tag(School.Eraser.rawValue)
                Text("Markers").tag(School.Markers.rawValue)
                Text("Crayons").tag(School.Crayons.rawValue)
                Text("Poster Boards").tag(School.Poster.rawValue)
                Text("Calculators").tag(School.Caclulator.rawValue)
                }
                Group{
                Text("Sharpeners").tag(School.Sharpeners.rawValue)
                }
           
            }
            }
            Group{
            Text("House Hold Items")
                .font(.title3)
            
            //Picker for household items
            Picker("HouseHold", selection: $selectedElectronic){
                Text("Furniture").tag(HouseHold.Furniture.rawValue)
                Text("Plants").tag(HouseHold.Plants.rawValue)
                Text("Kitchen Items").tag(HouseHold.Kitchen.rawValue)
                Text("Towels").tag(HouseHold.Towels.rawValue)
                Text("Beds").tag(HouseHold.Bed.rawValue)
           
            }
            }
 
            
            
            
        }
    }
}

struct ProductSelection_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelection()
    }
}
