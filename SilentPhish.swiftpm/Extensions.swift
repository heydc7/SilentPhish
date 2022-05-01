//
//  Extensions.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 20/04/22.
//

import Foundation

extension String {
    var isValidIpAddress: Bool {
        return self.matches(pattern: Regex.ipAddress)
    }
    
    var isValidHostname: Bool {
        return self.matches(pattern: Regex.hostname)
    }
    
    var isShorten: Bool {
        return self.matches(pattern: Regex.shortLink)
    }
    
    private func matches(pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func indicesOf(string: String) -> [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex
        
        while searchStartIndex < self.endIndex,
              let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
              !range.isEmpty
        {
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }
        
        return indices
    }
}
