//
//  CartView.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-04-15.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    
    @State var room = ""
    
    @ObservedObject var homeData: ViewModel
    @Environment(\.presentationMode) var present
    var body: some View {
        
        VStack{
            
            HStack(spacing: 20) {
                
                Button(action: {present.wrappedValue.dismiss()}) {
                 
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.black)
                }
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
            }//end of Hstack
            .padding()
        
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack(spacing: 5) {
                    
                    ForEach(homeData.cartItems) {cart in
                        
                     //cart item view
                        HStack(spacing:30) {
                            
                            WebImage(url: URL(string: cart.item.item_image))
                                .resizable()
                                .frame(width: 160, height: 130)
                                .cornerRadius(15)
                            
                            VStack(alignment: .center, spacing: 10){
                                
                                Text(cart.item.item_name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding()
                            
                              
                                
                                HStack(alignment: .center, spacing: 15){
                                Button( action: {
                                    
                                    if cart.quantity > 1 {
                                        homeData.cartItems[homeData.getIndex(item:
                                        cart.item,isCartIndex:
                                        true)].quantity
                                        -= 1
                                    }
                                }) {
                                  
                                    Image(systemName: "minus")
                                        .font(.system(size: 16, weight: .heavy))
                                        .foregroundColor(.black)
                                }
                                
                                Text("\(cart.quantity)")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,10)
                                    .background(Color.black.opacity(0.06))
                            
                                Button( action: {
                                    
                                    
                                        homeData.cartItems[homeData.getIndex(item:
                                        cart.item,isCartIndex: true)]
                                        .quantity
                                        += 1
                                    
                                }) {
                                  
                                    Image(systemName: "plus")
                                        .font(.system(size: 16, weight: .heavy))
                                        .foregroundColor(.black)
                                }
                                }
                                
                            }// end of Vtsack
                            
                            
                        }//end of hstack
                        .padding()
                        .contextMenu{
                            
                            Button(action: {
                                let index = homeData.getIndex(item: cart.item,
                                    isCartIndex: true)
                                
                                let itemIndex = homeData.getIndex(item: cart.item,
                                    isCartIndex: false)
                                
                                homeData.items[itemIndex].isAdded = false
                                
                                
                                homeData.cartItems.remove(at: index)
                            }) {
                                Text("Remove")
                            }
                        }
                    }
                }
                
            }//end of scroll view
            .frame(width: UIScreen.main.bounds.width - 30)

            //checkout button
            
            
            TextField("Enter Room number", text: $room)
            .frame(width: UIScreen.main.bounds.width - 30, height: 60)
            .clipShape(Rectangle())
            
            Divider()
           
                
            Button(action: homeData.updateOrder) {
                
                  
                Text(homeData.ordered ? "Cancel Order" : "Check Out")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                    .background(homeData.ordered ? Color.red : Color.green)
                    .cornerRadius(15)
            }
            
            
        }//end of Vstack
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
