//
//  ItemView.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-29.
//
import Firebase
import FirebaseFirestore
import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    
    @ObservedObject var model = ViewModel()
    var item: Item
  
    
    var body: some View {
       
        VStack{
            
            WebImage(url: URL(string: item.item_image))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            
            
            Text(item.item_name)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .padding()

            
        }
        
    }
   
        
    }

