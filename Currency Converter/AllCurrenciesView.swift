//
//  AllCurrenciesView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct AllCurrenciesView: View {
    @EnvironmentObject private var model: Model
    @State var searchText = ""
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
            NavigationStack {
                List {
                    ForEach(model.searchableCurrencies(text: searchText), id: \.self) { currency in
                        LabeledContent {
                            Button {
                                //add to favs method
                            } label: {
                                Text("Add")
                            }
                            .buttonStyle(.bordered)

                        } label: {
                            Text(currency.currencyNameForLocale() ?? currency)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .navigationTitle("All currencies")
            }
        }
        
    }
}

struct AllCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCurrenciesView()
            .environmentObject(Model())
    }
}
