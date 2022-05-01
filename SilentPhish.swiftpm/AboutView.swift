//
//  AboutView.swift
//  SilentPhishm
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        List {
            Section {
                VStack(alignment: .center, spacing: 20) {
                    Image("myPic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(4)
                    
                    Text("Hey 👋")
                        .font(.title)
                        .bold()
                    
                    Text("I am Dhanraj Chavan")
                        .font(.title)
                        .bold()
                    
                    Text("I'm a Computer Science student from India 🇮🇳")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("I am very passionate about Coding & Technology, as well as converting my ideas into apps, encouraging others to code through my Blogs & YouTube Channel.")
                            .multilineTextAlignment(.center)
                        
                        Text("I aimed to build SilentPhish - Swift Playground App to create an offline sandbox where a link can be analyzed based on various URL features using Machine Learning to detect whether the link is legitimate or phishing. In the future, my goal is to build a browser extension using Machine Learning which will show the user whether the website is legitimate or phishing.")
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("Thank you for checking out my Swift Playground App! 😊")
                        .font(.title)
                        .bold()
                }.padding()
            }
        }
        .navigationTitle("About Me")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
