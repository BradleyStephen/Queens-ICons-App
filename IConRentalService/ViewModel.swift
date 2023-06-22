//
//  ViewModel.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-28.
//  All rights reserved

import FirebaseFirestore
import SwiftUI
import Firebase
import Foundation
class ViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var items: [Item] = []
    
    //cart data
    @Published var cartItems: [Cart] = []
    
    @Published var ordered = false
    
    @Published var signedIn = false
    
    @Published var showMenu = false
    
  
    
    
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    
    //SignIn function
    func signIn(email: String, password: String)    {
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Sucess
                self?.signedIn = true
               
                //trying this out below
                print("Success = \(result!.user.uid)")
                
                
                //fetch data after log in
                self?.fetchData()
            }
            
        }
        
    }
    
    
    //SignUP function
    func signUp(email: String, password: String)    {
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //Sucess
                self?.signedIn = true
            }
          }
    }
        
    
    //sign out
    func signOut() {
            try? auth.signOut()
            
            self.signedIn = false
        }

    
    //fetch data new video
    func fetchData() {
        
        let db = Firestore.firestore()
        
        db.collection("Items").getDocuments { (snap, err) in
            
            guard let itemData = snap else{return}
            
            self.items = itemData.documents.compactMap({ (doc) -> Item? in
                
                let id = doc.documentID
                let name = doc.get("item_name") as! String
                let image = doc.get("item_image") as! String
                let available = doc.get("item_available") as! Int
                
                return Item(id: id, item_name: name, item_image: image, item_available: available)
                
            })
            
            
        }
    }
    
    //add to cart
    func addToCart(item: Item) {
        
        //checking it is added...
        
        self.items[getIndex(item: item, isCartIndex: false)].isAdded = !item.isAdded
        
        
        if item.isAdded {
            
            self.cartItems.remove(at: getIndex(item: item, isCartIndex: true))
            return
        }
        // else adding
        self.cartItems.append(Cart(item: item, quantity: 1))
        
    }
    
    
    //getIndex
    func getIndex(item: Item,isCartIndex: Bool)->Int {
        
        let index = self.items.firstIndex { (item1) -> Bool in
            
            return item.id == item1.id
        } ?? 0
        
        let cartIndex = self.cartItems.firstIndex { (item1) -> Bool in
            
            return item.id == item1.item.id
        } ?? 0
       
        return isCartIndex ? cartIndex : index
        
    }
    
    
    //order function into firestore
    
    func updateOrder(){
        
        let info = auth.currentUser?.email
       
        let db = Firestore.firestore()
        
        //creating dic of food details
        
        if ordered{
            
            ordered = false
            
            db.collection("Users").document(Auth.auth().currentUser!.uid).delete {
                (err) in
                
                if err != nil {
                    self.ordered = true
                }
            }
           return
        }
        
        
        var details : [[String: Any]] = []
        
        cartItems.forEach { (cart) in
            
            details.append([
                "item_name" : cart.item.item_name,
                "item_quantity" : cart.quantity,
                
            ])
            
          
        }
        
        ordered = true
        
        db.collection("Users").document(auth.currentUser!.uid).setData([
            
            "ordered_equipment": details,
            "Student_info": info as Any,
           
            
        ]) { (err) in
            
            if err != nil {
                
                self.ordered = false
                return
                
            }
            
            print("sucess")
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
