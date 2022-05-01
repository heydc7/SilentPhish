//
//  ResultView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 20/04/22.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var analysisReport: AnalysisReport
    
    // Animation
    @State private var scaleAmount: CGFloat = 1
    
    @ObservedObject var audioVM = AudioViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Result")) {
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            if (analysisReport.label >= 0 && analysisReport.label <= 33) {
                                Image(systemName: "checkmark.seal.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.green)
                                    .scaleEffect(scaleAmount)
                                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaleAmount)
                                    .onAppear {
                                        self.scaleAmount = 0.7
                                    }
                                
                                Text("Legitimate URL")
                                    .font(.title)
                                    .bold()
                                
                                Text("\(analysisReport.label, specifier: "%.2f")%")
                                    .font(.largeTitle)
                                    .bold()
                            } else if (analysisReport.label > 33 && analysisReport.label <= 60) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.yellow)
                                    .scaleEffect(scaleAmount)
                                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaleAmount)
                                    .onAppear {
                                        self.scaleAmount = 0.7
                                    }
                                
                                Text("Suspicious URL")
                                    .font(.title)
                                    .bold()
                                
                                Text("\(analysisReport.label, specifier: "%.2f")%")
                                    .font(.largeTitle)
                                    .bold()
                            } else if (analysisReport.label > 60) {
                                Image(systemName: "multiply.square.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.red)
                                    .scaleEffect(scaleAmount)
                                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaleAmount)
                                    .onAppear {
                                        self.scaleAmount = 0.7
                                    }
                                
                                Text("Phishing URL")
                                    .font(.title)
                                    .bold()
                                
                                Text("\(analysisReport.label, specifier: "%.2f")%")
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }.padding()
                        
                        Spacer()
                    }
                }
                
                Section(header: Text("Details")) {
                    HStack {
                        Text("Scheme: ")
                            .bold()
                        Text("\(analysisReport.scheme == 0 ? "https" : "http")")
                        Spacer()
                    }
                    HStack {
                        Text("Host: ")
                            .bold()
                        Text("\(analysisReport.host)")
                        Spacer()
                    }
                }
                
                Section(header: Text("Features")) {
                    Group {
                        ResultCell(txt: analysisReport.haveIp == 0 ? "The domain part has a hostname" : "The domain part has an IP Address", feature: analysisReport.haveIp, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.haveAtSign == 0 ? "@ Symbol is NOT present in URL" : "@ Symbol is present in URL", feature: analysisReport.haveAtSign, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.length == 0 ? "URL Length < 54" : "URL Length >= 54", feature: analysisReport.length, isSeparate: false)
                        
                        ResultCell(txt: "URL Depth = \(analysisReport.depth)", feature: analysisReport.depth, isSeparate: true)
                        
                        ResultCell(txt: analysisReport.redirection == 0 ? "No redirection to another website" : "'//' will redirect to another website", feature: analysisReport.redirection, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.httpDomain == 0 ? "http/https is not present in the domain part" : "http/https is present in the domain part", feature: analysisReport.httpDomain, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.tinyUrl == 0 ? "URL is not using any shortening service" : "Tiny URL: Using shortening service", feature: analysisReport.tinyUrl, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.prefixSuffix == 0 ? "'-' is not present in domain part" : "'-' is present in domain part", feature: analysisReport.prefixSuffix, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.scheme == 0 ? "Scheme: https" : "Scheme: http", feature: analysisReport.scheme, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.port == 0 ? "No Ports or Using Open Port(80:http,443:https)" : "Using Closed Port", feature: analysisReport.port, isSeparate: false)
                    }
                    
                    Group {
                        ResultCell(txt: analysisReport.dots == 0 ? "Number of dots in domain part <= 2" : "Number of dots in domain part > 2", feature: analysisReport.dots, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.query == 0 ? "Query Proportion <= 22%" : "Query Proportion > 22%", feature: analysisReport.query, isSeparate: false)
                        
                        ResultCell(txt: analysisReport.stats == 0 ? "The domain found in top 1 lakh legitimate domains" : "The domain not found in top 1 lakh legitimate domains", feature: analysisReport.stats, isSeparate: false)
                    }
                }
            }
            .navigationBarTitle("Analysis Report", displayMode: .inline)
            .onAppear {
                audioVM.playSuccessSound()
            }
        }
    }
}
