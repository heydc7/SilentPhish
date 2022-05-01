import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Intro")) {
                    NavigationLink(destination: IntroView()) {
                        Label("Getting Started", systemImage: "doc.plaintext")
                    }
                    NavigationLink(destination: FeaturesView()) {
                        Label("Phishing Features", systemImage: "sparkle.magnifyingglass")
                    }
                }
                
                Section(header: Text("Main")) {
                    NavigationLink(destination: AnalyzeView()) {
                        Label("Phishing Analyzer", systemImage: "square.stack.3d.forward.dottedline")
                    }
                }
                
                Section(header: Text("Outro")) {
                    NavigationLink(destination: NextStepsView()) {
                        Label("Next Steps & Quiz", systemImage: "bolt.shield")
                    }
                    
                    NavigationLink(destination: AboutView()) {
                        Label("About Me", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("Silent Phish")
        }
    }
}
