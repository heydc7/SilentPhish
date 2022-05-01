//
//  AnalyzeView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 19/04/22.
//

import SwiftUI

struct AnalyzeView: View {
    
    @State private var linkUrl = ""
    
    @State private var showResult = false
    
    @ObservedObject var analysisVM = AnalysisViewModel()
    
    @State private var actionSheet: ActionSheet?
    
    @State private var analysisReport = AnalysisReport(url: "", host: "", domain: "", label: 0, haveIp: 0, haveAtSign: 0, length: 0, depth: 0, redirection: 0, httpDomain: 0, tinyUrl: 0, prefixSuffix: 0, scheme: 0, port: 0, dots: 0, query: 0, stats: 0)
    
    // Alert
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    
    var body: some View {
        List {
            
            Section(header: Image("cover").resizable().scaledToFit().cornerRadius(12)) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to Phishing URL Analyzer!!!")
                        .font(.title)
                        .bold()
                    
                    Text("Please add the URL of a website to analyze whether the link is phishing or legitimate. Also, you can use the sample dataset provided below.")
                    
                    Text("URL should contain at least the following 2 parts in order to extract features.")
                        .bold()
                    
                    Text(verbatim: "1. Scheme (http:// or https://)")
                    Text(verbatim: "2. Host (www.<domain.com>)")
                }.padding()
            }
            
            
            Section(
                header: Text("URL"),
                footer: HStack {
                    Spacer()
                    
                    Button {
                        self.actionSheet = .second
                    } label: {
                        Label("Sample Dataset", systemImage: "doc.text")
                            .font(.headline)
                            .frame(width: 130, height: 30)
                    }.buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .padding([.horizontal, .top])

                    
                    Button {
                        self.analyseLink()
                    } label: {
                        Label("Analyse Link", systemImage: "bolt.shield")
                            .font(.headline)
                            .frame(width: 130, height: 30)
                    }.buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .padding([.horizontal, .top])
                    
                    Spacer()
                }
            ) {
                HStack {
                    TextField("URL", text: $linkUrl, prompt: Text("add URL here"))
                        .keyboardType(.URL)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .autocapitalization(.none)
                    
                    Spacer()
                    
                    if self.linkUrl.isEmpty {
                        Button {
                            self.linkUrl = UIPasteboard.general.string ?? ""
                        } label: {
                            Image(systemName: "doc.on.clipboard.fill")
                                .imageScale(.large)
                                .foregroundColor(.green)
                        }
                    } else {
                        Button {
                            self.linkUrl = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("PhishNet: ML Model")
                        .font(.title)
                        .bold()
                    
                    Text("1. Trained in CreateML")
                    Text("2. Used Algorithm: Random Forest")
                    Text("3. 13 Features are provided as input")
                    Text("4. Output: label (Double)(0: Legitimate, 1: Phishing)")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Result")
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .imageScale(.large)
                            .foregroundColor(.green)
                        
                        Text("0% - 33% : Legitimate URL")
                            .bold()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .imageScale(.large)
                            .foregroundColor(.yellow)
                        
                        Text("34% - 60% : Suspicious URL")
                            .bold()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "multiply.square.fill")
                            .imageScale(.large)
                            .foregroundColor(.red)
                        
                        Text("61% - 100% : Phishing URL")
                            .bold()
                        
                        Spacer()
                    }
                }.padding()
            }
            
            
        }
        .navigationTitle("Phishing URL Analyser")
        .sheet(item: self.$actionSheet) { item in
            switch item {
                case .first:
                    ResultView(analysisReport: $analysisReport)
                case .second:
                    PhishItemsView(selectedLink: self.$linkUrl)
            }
        }
        .sheet(isPresented: self.$showResult) {
            ResultView(analysisReport: $analysisReport)
        }
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text(self.alertTitle), message: Text(self.alertMsg), dismissButton: .default(Text("Ok")))
        }
    }
    
    func analyseLink() {
        guard let url = URL(string: self.linkUrl.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            // TODO: Show Alert
            self.showAlertView(title: "Invalid URL", msg: "Please check the URL again")
            return
        }
        if let _ = url.host, let _ = url.scheme {
            analysisVM.analyseLink(url: url) { result in
                switch result {
                    case .success(let report):
                        print(report)
                        self.analysisReport = report
                        self.actionSheet = .first
                    
                    case .failure(let err):
                        // TODO: Show Alert
                        if err == .invalidUrl {
                            self.showAlertView(title: "Invalid URL", msg: "Please check the URL again")
                        } else if err == .missingElements {
                            self.showAlertView(title: "Missing Parts", msg: "Please make sure URL has scheme & host in order to extract features")
                        } else {
                            self.showAlertView(title: "Something Went Wrong!", msg: "Please restart the app & try again")
                        }
                }
            }
        } else {
            // TODO: Show Alert
            self.showAlertView(title: "Missing Parts", msg: "Please make sure URL has scheme & host in order to extract features")
        }
    }
    
    // Show Alert
    func showAlertView(title: String, msg: String) {
        self.alertTitle = title
        self.alertMsg = msg
        self.showAlert = true
    }
}
