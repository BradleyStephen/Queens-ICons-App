//
//  Menu.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-04-16.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var viewModel: ViewModel
    @ObservedObject var homeData : ViewModel
   
    var body: some View {
       
        VStack{
        
            Spacer()
            
        NavigationLink( destination: CartView(homeData: homeData)) {
        
       
            HStack(spacing: 5){
           
                Text("Check Out")
                    .fontWeight(.semibold)
                    .font(.caption)
                    .padding(.horizontal,10)
                    .foregroundColor(Color.green)
                
                Image(systemName: "cart")
                .font(.title)
                .foregroundColor(Color.green)
                .padding()
             
                
                
            }
        
        }
           Spacer()
            
            NavigationLink(destination: HelpView()) {
            
          
                HStack(spacing: 15){
                    
                    Text("Help")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .padding(.horizontal,10)
                        .foregroundColor(Color.pink)
                    
                Image(systemName: "questionmark.circle.fill")
                    .font(.title)
                    .foregroundColor(Color.pink)
                    .padding()
                    
                }
            
            }
            
                
          Spacer()
            
            Button(action:  {
                viewModel.signOut()
            }, label: {
                
                VStack{
                    
                Text("Sign Out")
                .bold()
                .foregroundColor(.red)
                    
                    Image(systemName: "return")
                        .font(.title)
                        .foregroundColor(Color.red)
                        .padding()
                    
                }
                
            })
            
            Spacer()
           
        }

        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}

