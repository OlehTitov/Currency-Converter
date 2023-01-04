//
//  AllCurrenciesView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct AllCurrenciesView: View {
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var favs: Favourites
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
                    ForEach(model.searchableCurrencies(text: searchText), id: \.self) { item in
                        CurrencyRow(action: {
                                favs.contains(item) ? favs.remove(item) : favs.add(item)
                                },
                            currencyName: item.currencyNameForLocale() ?? item,
                            buttonLabel: favs.contains(item) ? "Remove" : "Add"
                        )
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
            .environmentObject(Favourites())
    }
}

struct CurrencyRow: View {
    var action: () -> Void
    var currencyName: String
    var buttonLabel: String
    var body: some View {
        LabeledContent {
            Button {
                //add to favs or remove
                action()
            } label: {
                Text(buttonLabel)
                    .frame(width: 80)
            }
            .buttonStyle(.bordered)
        } label: {
            Text(currencyName)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(1)
        }
    }
}
