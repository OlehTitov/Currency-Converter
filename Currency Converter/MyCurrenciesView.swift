//
//  MyCurrenciesView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct MyCurrenciesView: View {
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var favs: Favourites
    var body: some View {
        if favs.currencies.isEmpty {
            Text("Add some currencies to your favourites")
        } else {
            NavigationStack {
                List {
                    ForEach(favs.currencies, id: \.self) {item in
                        Text(item.currencyNameForLocale() ?? item)
                    }
                    .onDelete { indexSet in
                        favs.removeWithIndexSet(i: indexSet)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My currencies")
            }
        }
    }
}

struct MyCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCurrenciesView()
    }
}
