//
//  IntroView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 18/04/22.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        List {
            Section(header: Image("cover").resizable().scaledToFit().cornerRadius(12)) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("SilentPhish")
                        .font(.title)
                        .bold()
                    
                    Text("My Swift Playground App aims to demonstrate the detection of Phishing websites using Machine Learning to analyze the threat in an offline sandbox.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Why?")
                        .font(.title)
                        .bold()
                    
                    Text("I have seen some incidents of my friends & family where the person clicks on the link in SMS or email & suddenly something happens such as heating of device, ransom, etc. As a result, they lost money, sensitive data & most important privacy.")
                    
                    Text("Therefore, I aim to create an offline sandbox where a link can be analyzed based on various features using Machine Learning to detect whether the link is legitimate or phishing.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("What is Phishing?")
                        .font(.title)
                        .bold()
                    
                    Text("Phishing is a type of social engineering where an attacker sends a fraudulent message designed to trick a person into revealing sensitive information to the attacker or to deploy malicious software on the victim's infrastructure like ransomware.")
                    
                    Text("Phishing has become one of the biggest & most effective cyber threats, causing hundreds of millions of dollars in losses & millions of data breaches every year.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("How does it work?")
                        .font(.title)
                        .bold()
                    
                    Text("This type of attack earned its name because, like its homophone 'fishing', it uses bait. In a phishing attack, bait often appears as a compelling email. Attackers go to great lengths to ensure that their email or message appears as legitimate as possible. This most commonly directs target recipients to an attacker-controlled website that delivers malware or intercepts user credentials.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Types of data compromised in phishing attacks")
                        .font(.title)
                        .bold()
                    
                    Text("1. Credentials (passwords, usernames, pin numbers)")
                    Text("2. Personal Data (name, address, email address)")
                    Text("3. Medical (treatment information, insurance claims)")
                }.padding()
            }
            
            Section(footer: Text("Source: APWG Phishing Activity Trends Report Q3 2021")) {
                BarChart(title: "Phishing Statistics", legend: "2019-2021", barColor: .blue, data: Constants.PhishingDataset.charDataSet)
                    .frame(height: 400)
            }
            
            Section(footer: Text("Source: APWG Phishing Activity Trends Report")) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Most Targeted Industries 3Q 2021")
                        .font(.title)
                        .bold()
                    
                    Text("1. SAAS/Webmail")
                    Text("2. Financial Institutions")
                    Text("3. eCommerce/Retail")
                    Text("4. Social Media")
                    Text("5. Payment")
                    Text("6. Crypto")
                    Text("7. Logistics/Shiping")
                    Text("8. Telecom")
                }.padding()
            }
        }
        .navigationTitle("Getting Started")
    }
}

