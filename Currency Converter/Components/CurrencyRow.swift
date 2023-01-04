//
//  CurrencyRow.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

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

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRow(action: {}, currencyName: "US Dollar", buttonLabel: "Add")
    }
}
