//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import Foundation

enum ActionSheet : Identifiable {
    case first
    case second
    
    var id: Int {
        self.hashValue
    }
}
