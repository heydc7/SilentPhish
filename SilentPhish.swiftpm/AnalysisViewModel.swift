//
//  AnalysisViewModel.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 20/04/22.
//

import SwiftUI
import CoreML

class AnalysisViewModel: ObservableObject {
    
    func analyseLink(url: URL, completion: @escaping (Result<AnalysisReport,AnalysisError>) -> Void) {
        if let host = url.host, let scheme = url.scheme {
            let port = url.port
            let query = url.query
            //let paths = url.pathComponents
            //let baseUrl = url.baseURL?.absoluteString
            let strUrl = url.absoluteString
            let domain = getDomain(host: host)
            
            
            let haveIp = checkIp(domain: domain)
            let haveAt = checkAt(url: strUrl)
            let urlLength = checkLength(url: strUrl)
            let urlDepth = checkDepth(url: strUrl)
            let redirection = checkRedirection(url: strUrl)
            let httpDomain = checkHttpDomain(domain: domain)
            let tinyUrl = checkTiny(domain: domain)
            let prefixSuffix = checkDash(domain: domain)
            let urlScheme = checkScheme(scheme: scheme)
            let urlPort = checkPort(port: port)
            let dots = checkDots(domain: domain)
            let queries = checkQuery(url: strUrl, query: query)
            let stats = checkStats(domain: domain)
            
            do {
                let config = MLModelConfiguration()
                let model = try PhishNet(configuration: config)
                
                let prediction = try model.prediction(haveIp: Double(haveIp), haveAtSign: Double(haveAt), length: Double(urlLength), depth: Double(urlDepth), redirection: Double(redirection), httpDomain: Double(httpDomain), tinyUrl: Double(tinyUrl), prefixSuffix: Double(prefixSuffix), scheme: Double(urlScheme), port: Double(urlPort), dots: Double(dots), query: Double(queries), stats: Double(stats))
                
                let label = prediction.label * 100
                
                let analysisReport = AnalysisReport(url: strUrl, host: host, domain: domain, label: label, haveIp: haveIp, haveAtSign: haveAt, length: urlLength, depth: urlDepth, redirection: redirection, httpDomain: httpDomain, tinyUrl: tinyUrl, prefixSuffix: prefixSuffix, scheme: urlScheme, port: urlPort, dots: dots, query: queries, stats: stats)
                
                completion(.success(analysisReport))
            } catch {
                print("Failed to ML Model")
                completion(.failure(.modelLoadingFailed))
            }
        } else {
            completion(.failure(.missingElements))
        }
    }
    
    // MARK: 0. Get Domain
    func getDomain(host: String) -> String {
        var domain = host
        if domain.contains("www.") {
            domain = domain.replacingOccurrences(of: "www.", with: "")
        }
        return domain
    }

    // MARK: 1. Check IP
    func checkIp(domain: String) -> Int {
        var result = 0
        if (domain.isValidIpAddress) {
            result = 1
        } else if (domain.isValidHostname) {
            result = 0
        } else {
            print("URL is invalid")
        }
        return result
    }
    
    // MARK: 2. Check @ Symbol
    func checkAt(url: String) -> Int {
        if (url.contains("@")) {
            return 1
        }
        return 0
    }
    
    // MARK: 3. Check URL Length
    func checkLength(url: String) -> Int {
        if (url.count < 54) {
            return 0
        }
        return 1
    }
    
    // MARK: 4. Check URL Depth
    func checkDepth(url: String) -> Int {
        let parts = url.split(separator: "/")
        var depth = 0
        for part in parts {
            if (part.count != 0) {
                depth += 1
            }
        }
        return depth
    }
    
    // MARK: 5. Check Redirection
    func checkRedirection(url: String) -> Int {
        let pos = url.indicesOf(string: "//")
        if (pos.count > 1) {
            return 1
        }
        return 0
    }
    
    // MARK: 6. Check HTTP/HTTPS in Domain
    func checkHttpDomain(domain: String) -> Int {
        if (domain.contains("https") || domain.contains("http")) {
            return 1
        }
        return 0
    }
    
    // MARK: 7. Check Tiny URL
    func checkTiny(domain: String) -> Int {
        if (domain.isShorten) {
            return 1
        }
        return 0
    }
    
    // MARK: 8. Check Dash
    func checkDash(domain: String) -> Int {
        if (domain.contains("-")) {
            return 1
        }
        return 0
    }
    
    // MARK: 9. Check Scheme
    func checkScheme(scheme: String) -> Int {
        if (scheme == "https") {
            return 0
        }
        return 1
    }
    
    // MARK: 10. Check Port
    func checkPort(port: Int?) -> Int {
        guard let port = port else {
            return 0
        }
        if (port == 80 || port == 443) {
            return 0
        }
        return 1
    }
    
    // MARK: 11. Check Dots
    func checkDots(domain: String) -> Int {
        var count = 0
        for c in domain {
            if (c == ".") {
                count += 1
            }
        }
        if (count > 2) {
            return 1
        }
        return 0
    }
    
    // MARK: 12. Check Queries
    func checkQuery(url: String, query: String?) -> Int {
        guard let query = query else {
            return 0
        }
        let urlCount = Float(url.count)
        let queryCount = Float(query.count)
        let proportion = (queryCount/urlCount) * 100
        if (proportion > 22) {
            return 1
        }
        return 0
    }
    
    // MARK: 13. Check Stats
    func checkStats(domain: String) -> Int {
        if let jsonData = readLocalFile(forName: "legitimate") {
            let legitUrls = parse(jsonData: jsonData)
            if legitUrls.contains(where: { $0.url == domain }) {
                return 0
            } else {
                return 1
            }
        } else {
            return 0
        }
    }
    
    
    // MARK: READ LOCAL FILE
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch let err {
            print("Error Reading Local File: \(err)")
        }
        return nil
    }
    
    // MARK: PARSE JSON
    private func parse(jsonData: Data) -> [Link] {
        do {
            let decodedData = try JSONDecoder().decode([Link].self, from: jsonData)
            return decodedData
        } catch let parseErr {
            print("Error Decoding Legit Urls: \(parseErr)")
            return []
        }
    }

}
