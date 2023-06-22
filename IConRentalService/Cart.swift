//
//  Cart.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-29.
//

import SwiftUI

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
    
    
}
