//
//  AllCurrenciesView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct AllCurrenciesView: View {
    @EnvironmentObject private var model: Model
    var body: some View {
        if model.currencies.isEmpty {
            VStack {
                Text("Loading currencies...")
                ProgressView()
            }
            .task {
                await model.getLatestRates()
            }
        } else {
            List {
                ForEach(model.currencies, id: \.self) { currency in
                    Text(currency)
                }
            }
        }
        
    }
}

struct AllCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCurrenciesView()
    }
}
