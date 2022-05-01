//
//  NextStepsView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct NextStepsView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Prevention Techniques")
                        .font(.title)
                        .bold()
                    
                    Text("1. Use SilentPhish to check whether the URL is legitimate or phishing.")
                        .bold()
                    
                    Text("2. Check the link, before you click by hovering on the hyperlink.")
                        .bold()
                    
                    Text("3. Keep all systems up to date with the latest security patches & updates.")
                        .bold()
                    
                    Text("4. Install & use firewalls (Desktop Firewall & Network Firewall).")
                        .bold()
                    
                    Text("5. Never submit your personal sensitive information.")
                        .bold()
                    
                    Text("6. Create awareness & provide training about Phishing.")
                        .bold()
                    
                    Text("7. Use Multi-Factor Authentication")
                        .bold()
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("What should I do after a phishing attack?")
                        .font(.title)
                        .bold()
                    
                    Text("1. Do not panic, take a deep breath.")
                        .bold()
                    
                    Text("2. Disconnect the device from the internet & Backup your files.")
                        .bold()
                    
                    Text("3. Change your passwords. In case of financial credentials, contact your bank as soon as possible.")
                        .bold()
                    
                    Text("4. Scan your computer/system & network for viruses.")
                        .bold()
                    
                    Text("5. File a report to nearest CyberCell.")
                        .bold()
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Phishing Quiz")
                        .font(.title)
                        .bold()
                    
                    Text("A simple quiz about what you've just learned about Phishing")
                        .bold()
                    
                    Button {
                        self.showSheet = true
                    } label: {
                        Text("Start Quiz")
                            .font(.headline)
                            .frame(width: 100, height: 30)
                    }.buttonStyle(.borderedProminent)
                    .tint(.blue)
                }.padding()
            }
        }
        .navigationTitle("Next Steps")
        .sheet(isPresented: self.$showSheet) {
            QuizView()
        }
    }
    
}
