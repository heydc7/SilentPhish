//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import Foundation

struct Question: Identifiable {
    
    var id = UUID()
    var txt : String
    var options : [Answer]
    
}
