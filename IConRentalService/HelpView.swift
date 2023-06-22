//
//  HelpView.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-04-15.
//

import SwiftUI

struct FlatnilGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}

struct HelpView: View {
    
    
    var body: some View {
        
        ZStack{
            Image("QueensBackground")
            .resizable()
            .ignoresSafeArea()
        
        
        VStack{
            Text("Please Visit the Icon desk for futher assistance")
            .fontWeight(.bold)
            .frame(width: 300, height:150)
            .modifier(FlatnilGlassView())
            
            
            
            Link("Icons Website",
            destination: URL(string: "https://www.engsoc.queensu.ca/services/integrated-constables/")!)
            .modifier(FlatnilGlassView())
            .frame(width: 300, height: 150)
            
            Divider()
                
               
                Link("Social Media Guidelines",
                destination: URL(string: "https://www.queensu.ca/socialmedia/guidelines")!)
                .modifier(FlatnilGlassView())
                .frame(width: 300, height: 150)
              
            Spacer()
        }
            }
        
        .navigationTitle("Help")
        
     
        
        
    }
}

