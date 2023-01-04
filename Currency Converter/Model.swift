//
//  Model.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

class Model: ObservableObject {
    @Published var currencies: [String] = []
}
