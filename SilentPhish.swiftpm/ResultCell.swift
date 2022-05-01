//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 21/04/22.
//

import SwiftUI

struct ResultCell: View {
    
    var txt: String
    var feature: Int
    var isSeparate: Bool
    
    var body: some View {
        if isSeparate {
            HStack {
                Image(systemName: "circle.circle")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                
                Text("\(txt)")
                    .font(.headline)
            }
        } else {
            HStack {
                Image(systemName: feature == 0 ? "checkmark.circle" : "multiply.circle")
                    .imageScale(.large)
                    .foregroundColor(feature == 0 ? .green : .red)
                
                Text("\(txt)")
                    .font(.headline)
            }
        }
    }
}
