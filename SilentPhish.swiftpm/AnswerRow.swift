//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct AnswerRow: View {
    
    var answer: Answer
    
    @State private var isSelected = false
    
    @ObservedObject var audioVM = AudioViewModel()
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.txt)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .font(.headline)
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }.padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ? .gray : .black)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            self.isSelected = true
            if answer.isCorrect {
                audioVM.playSuccessSound()
            } else {
                audioVM.playErrorSound()
            }
        }
    }
    
}
