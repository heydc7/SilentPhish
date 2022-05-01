//
//  File.swift
//  SilentPhish
//
//  Created by Dhanraj Chavan on 20/04/22.
//

import Foundation

struct AnalysisReport {
    var url: String
    var host: String
    var domain: String
    var label: Double
    var haveIp: Int
    var haveAtSign: Int
    var length: Int
    var depth: Int
    var redirection: Int
    var httpDomain: Int
    var tinyUrl: Int
    var prefixSuffix: Int
    var scheme: Int
    var port: Int
    var dots: Int
    var query: Int
    var stats: Int
}
