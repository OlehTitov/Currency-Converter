//
//  Model.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

class Model: ObservableObject {
    @Published var currencies: [String] = []
    @Published var conversionInProgress: Bool = false
    
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
    
    func convert(from: String, to: String, amount: Double) async -> Double? {
        showConversionprogress(show: true)
        let response = await APIClient.convert(from: from, to: to, amount: amount)
        guard let response = response else {
            showConversionprogress(show: false)
            return nil
        }
        if response.success == true {
            showConversionprogress(show: false)
            return response.result
        } else {
            showConversionprogress(show: false)
            return nil
        }
    }
    
    func showConversionprogress(show: Bool) {
        DispatchQueue.main.async {
            self.conversionInProgress = show
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
