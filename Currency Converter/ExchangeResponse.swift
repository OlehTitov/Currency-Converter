//
//  ExchangeResponse.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

struct ExchangeResponse: Codable {
    let motd: MOTD
    let success: Bool
    let base, date: String
    let rates: [String: Double]
}

struct MOTD: Codable {
    let msg: String
    let url: String
}
