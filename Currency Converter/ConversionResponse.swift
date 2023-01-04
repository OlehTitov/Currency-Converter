//
//  ConversionResponse.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

struct ConversionResponse: Codable {
    let motd: MOTD
    let success: Bool
    let query: Query
    let info: Info
    let historical: Bool
    let date: String
    let result: Double
}

struct Info: Codable {
    let rate: Double
}

struct Query: Codable {
    let from, to: String
    let amount: Double
}
