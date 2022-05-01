//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct PhishItemsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedLink: String
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Source: Mendeley Data")) {
                    ForEach(Constants.PhishingDataset.links, id: \.self) { item in
                        Text(verbatim: item)
                            .lineLimit(nil)
                            .padding(6)
                             .onTapGesture {
                                self.selectedLink = item
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
            }
            .navigationTitle("Sample Dataset (Legitimate + Phishing)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

