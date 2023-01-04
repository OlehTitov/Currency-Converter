//
//  String+currencyNameForLocale.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation


extension String {
    func currencyNameForLocale() -> String? {
        return Locale.current.localizedString(forCurrencyCode: self)
    }
}

