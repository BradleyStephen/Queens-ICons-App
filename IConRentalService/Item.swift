//
//  Todo.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-28.
//

import Foundation


struct Item: Identifiable {
    
    var id: String
    var item_name: String
    var item_image: String
    var item_available: Int
    //to indefiy wether its added or not
    var isAdded: Bool = false
    
}
