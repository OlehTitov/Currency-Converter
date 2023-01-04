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
    
    func searchableCurrencies(text: String) -> [String] {
        if text.isEmpty {
            return self.currencies.sorted()
        } else {
            return self.currencies.filter {
                guard let name = $0.currencyNameForLocale() else {
                    return $0.localizedCaseInsensitiveContains(text)
                }
                return name.localizedCaseInsensitiveContains(text)
            }
        }
    }
}
