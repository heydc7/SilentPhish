//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 23/04/22.
//

import SwiftUI

struct BarChart: View {
    
    var title: String
    var legend: String
    var barColor: Color
    var data: [ChartData]
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    
    @State private var touchLocation: CGFloat = -1
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .font(.largeTitle)
                Text("Value: \(currentValue)")
                    .font(.headline)
                    .padding(.vertical, 4)
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            ForEach(0..<data.count, id: \.self) { i in
                                BarChartCell(value: normalizedValue(index: i), barColor: barColor)
                                    .opacity(barIsTouched(index: i) ? 1 : 0.7)
                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                    .animation(.spring(), value: 1)
                                    .padding(.top)
                            }
                        }
                            .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ position in
                                    let touchPosition = position.location.x/geometry.frame(in: .local).width
                                                            
                                    touchLocation = touchPosition
                                    updateCurrentValue()
                                })
                                .onEnded({ position in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(Animation.easeOut(duration: 0.5)) {
                                            resetValues()
                                        }
                                    }
                                })
                            )
                        if currentLabel.isEmpty {
                            Text(legend)
                                .bold()
                                .foregroundColor(.black)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                                .padding()
                        } else {
                            Text(currentLabel)
                                .bold()
                                .foregroundColor(.black)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                                .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                                .animation(.easeIn, value: 1)
                                .padding()
                        }
                    }
                }
            }
                .padding()
        }
        
        func normalizedValue(index: Int) -> Double {
            var allValues: [Double]    {
                var values = [Double]()
                for data in data {
                    values.append(data.value)
                }
                return values
            }
            guard let max = allValues.max() else {
                     return 1
            }
            if max != 0 {
                return Double(data[index].value)/Double(max)
            } else {
                return 1
            }
        }
        
        func barIsTouched(index: Int) -> Bool {
            touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
        }
        
        func updateCurrentValue()    {
            let index = Int(touchLocation * CGFloat(data.count))
            guard index < data.count && index >= 0 else {
                currentValue = ""
                currentLabel = ""
                return
            }
            currentValue = "\(Int(data[index].value))"
            currentLabel = data[index].label
        }
        
        func resetValues() {
            touchLocation = -1
            currentValue  =  ""
            currentLabel = ""
        }
        
        func labelOffset(in width: CGFloat) -> CGFloat {
            let currentIndex = Int(touchLocation * CGFloat(data.count))
            guard currentIndex < data.count && currentIndex >= 0 else {
                return 0
            }
            let cellWidth = width / CGFloat(data.count)
            let actualWidth = width -    cellWidth
            let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
            return position
        }
}
