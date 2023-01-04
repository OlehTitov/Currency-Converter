//
//  Model.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

class Model: ObservableObject {
    @Published var currencies: [String] = []
    
    func getLatestRates() async {
        let response = await APIClient.getLatestRates()
        guard let response = response else { return }
        let fetchedRates = response.rates
        let fetchedCurrencies = fetchedRates.keys
        let array = Array(fetchedCurrencies)
        DispatchQueue.main.async {
            self.currencies = array
        }
    }
}
