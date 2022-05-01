//
//  FeaturesView.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 19/04/22.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        List {
            Group {
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Feature Extraction")
                            .font(.title)
                            .bold()
                        
                        Text("Feature extraction involves reducing the number of resources required to describe a large set of data. This is done with dimensionality reduction to transform large input data into smaller, meaningful groups for processing.")
                        
                        Text("In this section, we are going to learn about various features which will help to effectively determine the legitimate and phishing URL.")
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Data Collection")
                            .font(.title)
                            .bold()
                        
                        Text("For Feature Extraction, the dataset consists of a collection of legitimate as well as phishing website instances. Each website is represented by a label that denotes, whether the website is legitimate or not.")
                        
                        Text("Phishing Website Dataset")
                            .bold()
                        
                        Text("Total number of instances: 88,647")
                        
                        Text("Number of legitimate website instances(labeled as 0): 58,000")
                        
                        Text("Number of phishing website instances(labeled as 1): 30,647")
                        
                        Text("Reference: Vrbancic, Grega (2020), “Phishing Websites Dataset”, Mendeley Data, V1, doi: 10.17632/72ptz43s9v.1")
                    }.padding()
                }
                
                Section(footer: Text("above files are present in 'other' folder")) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Extracting Features using Python")
                            .font(.title)
                            .bold()
                        
                        Text("1. Used Google Colab Notebook with Python (SilentPhish.ipynb)")
                        Text("2. 13 address based features are extracted in 'allFeatures.csv'")
                        Text("3. 'label' column consist of 0's (legitimate) & 1's (phishing)")
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("1. IP Address")
                            .font(.title)
                            .bold()
                        
                        Text(verbatim: "If the website is using an IP address as an alternative domain name in the URL, such as 'http://210.212.1.123/index.php', someone is trying to steal the user's personal information.")
                        
                        Text("If: The domain part has an IP Address -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("2. @ Symbol")
                            .font(.title)
                            .bold()
                        
                        Text("Using the '@' symbol in the URL leads the browser to ignore everything proceeding with the '@' symbol & real addresses often follow the '@' symbol.")
                        
                        Text("If: URL having '@' symbol -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("3. URL Length")
                            .font(.title)
                            .bold()
                        
                        Text("Computes the length of the URL. Phishers can use long URLs to hide doubtful parts in the address bar.")
                        
                        Text("If: URL Length >= 54 -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("4. URL Depth")
                            .font(.title)
                            .bold()
                        
                        Text("Computes the depth of URL. This feature calculates the number of subpages in the given URL based on '\'.")
                        
                        Text("The value of this feature is numerical based on the URL.")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("5. Redirection")
                            .font(.title)
                            .bold()
                        
                        Text("Checks the presence of '//' in the URL. The existence of '//' in the URL path means that the user will be redirected to another website. It will find '//' after the scheme(http:// or https://).")
                        
                        Text("If: The position of the last occurance of '//' in the URL > 7 -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("6. HTTP/HTTPS Token in Domain")
                            .font(.title)
                            .bold()
                        
                        Text("Checks the presence of 'http/https' in the domain part of the URL. The phishers may add the 'https' token to the domain part of the URL to trick users.")
                        
                        Text("If: Using 'http/https' token in the domain part of URL -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("7. Tiny URL")
                            .font(.title)
                            .bold()
                        
                        Text("URL Shortening is a method in which a URL may be made considerably smaller in length & still lead to the required website. This is accomplished by means of an 'HTTP Redirect' on a domain that is short, which links to the webpage that has a long URL")
                        
                        Text("If: Using shortening services (TinyURL) -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                        
                        Text("Shortening Services: ")
                            .bold()
                        
                        Text("\(Constants.Services.shortening)")
                    }.padding()
                }
            }
            
            Group {
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("8. Prefix/Suffix '-' in Domain")
                            .font(.title)
                            .bold()
                        
                        Text("Checking the presence of '-' in the domain part of the URL. The dash symbol '-' is rarely used in legitimate URLs. Phishers tend to add prefixes or suffixes separated by '-' to the domain name so that users feel that they are dealing with a legitimate website.")
                        
                        Text("If: Domain part includes '-' symbol -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("9. Scheme")
                            .font(.title)
                            .bold()
                        
                        Text("'HTTPS' uses TLS(SSL) to encrypt normal HTTP requests & responses. As a result, 'HTTPS' is far more secure than HTTP")
                        
                        Text("If: Scheme: 'https' -> feature = 0 (Legitimate)\nOtherwise: -> feature = 1 (Phishing)")
                            .bold()
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("10. Ports")
                            .font(.title)
                            .bold()
                        
                        Text("It validates whether the service is up or down on a specific server. If all ports are open, phishers can run almost any service they want & as a result user information is threatened.")
                        
                        Text("If: Using closed ports -> feature = 1 (Phishing)\nOtherwise: Using Open Ports -> feature = 0 (Legitimate)")
                            .bold()
                        
                        Text("Common Ports:")
                            .bold()
                        
                        Text("Open Ports- 80:HTTP, 443:HTTPS")
                        Text("Closed Ports- 21:FTP, 22:SSH, 23:Telnet, 445:SMB, 1443:MSSQL, 1521:ORACLE, 3306:MySQL, 3389:RemoteDesktop")
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("11. Dots")
                            .font(.title)
                            .bold()
                        
                        Text(verbatim: "A domain name might include the country code top-level domains (ccTLD) such as 'uk' & other details like category as 'ac' academic. Ex. http://www.hud.ac.uk/")
                        
                        Text("If: Dots in domain part > 2 -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()
                        
                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("12. Queries")
                            .font(.title)
                            .bold()
                        
                        Text("Request URL examines the external objects contained within a webpage such as images and videos that are loaded from another domain. In legitimate webpages, the webpage address & most of the objects embedded within the webpage are sharing the same domain.")
                        
                        Text("If: % of request in URL > 22% -> feature = 1 (Phishing)\nOtherwise: -> feature = 0 (Legitimate)")
                            .bold()

                    }.padding()
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("13. Statistics Reports")
                            .font(.title)
                            .bold()
                        
                        Text("This feature validates whether the host is present in the top 1,00,000 domains or not.")
                        
                        Text("If: If host present in top 1,00,000 domains -> feature = 0 (Legitimate)\nOtherwise: Using Open Ports -> feature = 1 (Phishing)")
                            .bold()
                        
                        Text(verbatim: "Reference: Top 1M Ranked Legitimate URLs - Tranco (https://tranco-list.eu/)")
                    }.padding()
                }
                
            }
        }
        .navigationTitle("Phishing Website Features")
    }
}
