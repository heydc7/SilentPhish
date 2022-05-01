//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 22/04/22.
//

import SwiftUI

struct QuestionView: View {
    
    var index: Int
    var question: Question
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("\(index) out of 5")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading, spacing: 20) {
                Text(question.txt)
                    .font(.headline)
                    .bold()
                    
                ForEach(question.options, id: \.id) { option in
                    AnswerRow(answer: Answer(txt: option.txt, isCorrect: option.isCorrect))
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
    }
}
