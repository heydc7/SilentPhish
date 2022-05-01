# SilentPhish
Swift Student Challenge Submission | WWDC 2022

### ⭐ Watch Preview ⭐
![cover](https://user-images.githubusercontent.com/39642060/166147824-4068020b-8bcf-4628-8a92-54d13d6502ee.png)

My Swift Playground App aims to demonstrate the detection of Phishing websites using Machine Learning to analyze the threat in an offline sandbox.

Introducing SilentPhish!!! SilentPhish is an offline sandbox where a link can be analyzed based on various URL features using Machine Learning to detect whether the link is legitimate or phishing.

Let's get started!

### Feature Extraction:
A URL is composed of different parts, some mandatory & others optional. Some characteristics distinguish phishing websites from a legitimate websites.

Feature Extraction is done using GoogleColab using Python. Phishing Dataset is obtained from "Mendeley Data" which consists of 88647 URLs (Legitimate: 8000, Phishing: 30647). Legitimate labeled as 0 & Phishing labeled as 1. All Features are extracted into the allFeatures.csv file.

### Features:
Have IP, Have @ Symbol, URL Length, URL Depth, Redirection, HTTP in Domain, TinyURL, Dash in Domain, Scheme, Port, Dots, Queries, Legitimate Stats. 

### Training PhishNet:
PhishNet is ML-Model trained in CreateML with Random Forest Algorithm. 
13 features are used as input & label as output. 

### Working:
1) Navigate to SilentPhish Analyzer.
2) You can type or paste the URL in the text field or select it from Sample Dataset.
3) Click on the "Analyze Link" button. It will extract all features from the URL & use PhishNet ML-Model to predict the label output.
7) It will categorize the analysis depending on threat percentage. (0%-33%: Legitimate, 34%-60%: Suspicious, 61%-100%: Phishing)
7) It will show threat percentage & feature details about the URL.

Hurray! This is how we can simply check any suspicious link using SilentPhish in an offline sandbox. This will help to prevent harmful phishing attacks. 

In the future, my goal is to build a browser extension using Machine Learning which will show the user whether the website is legitimate or phishing.

### Technology Used:
SwiftUI, CreateML, CoreML, AVKit, Python, GoogleColab

### Credits:
1) Vrbancic, Grega (2020), Mendeley Data
2) Top 1M Ranked Legitimate URLs - Tranco (https://tranco-list.eu/)
3) APWG Phishing Activity Trends Report
4) PhishTank (https://phishtank.org/)
5) Icons: Freepik & FlatIcon
6) Sounds (freesounds.org)

Thank you for checking out my Swift Playground App!!!
