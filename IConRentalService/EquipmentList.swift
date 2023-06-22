//
//  EquipmentList.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-27.
//  all rights reserved

import SwiftUI


//Created By Robert Yu All Rights reserved
struct Equipment: Identifiable {
    let id = UUID()
    let equipmentName: String
    let quantity: Int
    let equipTitle: String
   
    
}

struct EquipmentList {
    
    static let availableEquipment = [
        //
        Equipment(equipmentName: "12VMotor",
        quantity: 5,
        equipTitle: "Motor"
        ),
        
        Equipment(equipmentName: "Aurdunio",
        quantity: 5,
        equipTitle: "Aurdunio"
        ),
        
        Equipment(equipmentName: "EngLinks",
        quantity: 50,
        equipTitle: "EngLinks"
        ),
        
        Equipment(equipmentName: "LaptopCharger",
        quantity: 10,
        equipTitle: "LaptopCharger"
        ),
        
        Equipment(equipmentName: "MacbookCharger",
        quantity: 10,
        equipTitle: "MacbookChargerr"
        ),
        
        Equipment(equipmentName: "PhoneCharger",
        quantity: 10,
        equipTitle: "PhoneCharger"
        ),
        
        Equipment(equipmentName: "WhiteboardMarker",
        quantity: 100,
        equipTitle: "WhiteboardMarker"
        ),
        
        Equipment(equipmentName: "Paper",
        quantity: 100,
        equipTitle: "paper"
        ),
        
                                    ]
                    }
