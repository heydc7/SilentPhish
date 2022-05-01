//
//  QuizView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let questions = [
        Question(txt: "What are the most common signs of a phishing scams?", options: [Answer(txt: "Nice graphics and layout", isCorrect: false), Answer(txt: "Contains personal information", isCorrect: false), Answer(txt: "Proper spelling and grammar", isCorrect: false), Answer(txt: "Unknown sender, sense of urgency, unexpected attachment, or too good to be true", isCorrect: true)]),
        Question(txt: "An email from your boss asks for the name, addresses, and credit card information of the company’s top clients. The email says it’s urgent and to please reply right away. You should reply right away. True or False?", options: [Answer(txt: "True", isCorrect: false), Answer(txt: "False", isCorrect: true)]),
        Question(txt: "If you fall for a phishing scam, what should you do to limit the damage?", options: [Answer(txt: "Delete the phishing email", isCorrect: false), Answer(txt: "Unplug the computer. This will get rid of any malware", isCorrect: false), Answer(txt: "Change the compromised passwords", isCorrect: true)]),
        Question(txt: "Unsure whether an email is real or phishing? Which of the following should you do?", options: [Answer(txt: "An unknown email sender sound vague or generic, and is threatening something about one of your online accounts? Report it as phishing.", isCorrect: false), Answer(txt: "An alert email comes from PayPal or your bank. Open a new browser window and go to your account to see if anything is happening with your account.", isCorrect: false), Answer(txt: "An offer appears to be from Amazon, but upon closer inspection it's actually from Amzon.co. You should report and delete the email.", isCorrect: false), Answer(txt: "All of the above", isCorrect: true)]),
        Question(txt: "What should you do as an employee if you suspect a phishing attack?", options: [Answer(txt: "Report it so the organization can investigate.", isCorrect: true), Answer(txt: "Ignore it.", isCorrect: false), Answer(txt: "Open the email and see whether it looks legitimate.", isCorrect: false), Answer(txt: "Show your coworkers to see what they think.", isCorrect: false)])
    ]
    
    @State private var currentIndex = 0
    
    // Alert
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 20) {
                QuestionView(index: currentIndex + 1, question: questions[currentIndex])
                
                Button {
                    showNext()
                } label: {
                    Text(currentIndex == 4 ? "Finish" : "Next")
                        .font(.headline)
                        .frame(width: 75, height: 30)
                }.buttonStyle(.borderedProminent)
                .padding()
                
                Spacer()
            }.padding(24)
            
            .navigationTitle("Phishing Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(self.alertTitle), message: Text(self.alertMsg), dismissButton: .default(Text("Ok"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            }
        }
    }
    
    func showNext() {
        if currentIndex == 4 {
            self.showAlertView(title: "Thank you!", msg: "I hope you've learned about phishing & prevention techniques.")
        } else {
            self.currentIndex += 1
        }
    }
    
    // Show Alert
    func showAlertView(title: String, msg: String) {
        self.alertTitle = title
        self.alertMsg = msg
        self.showAlert = true
    }
}
