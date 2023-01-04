//
//  ConvertView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct ConvertView: View {
    var sourceCurrency: String
    @State var sourceAmount: Double = 0.00
    @State var targetAmount: Double = 0.00
    @FocusState private var focusedField: Bool
    var body: some View {
        List {
            //Source currency
            LabeledContent {
                TextField("Source amount", value: $sourceAmount, format: .number)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("OK") {
                                //Call API to make conversion
                                focusedField = false
                            }
                        }
                    }
            } label: {
                Text(sourceCurrency)
            }
            .listRowSeparator(.hidden)
            //Target currency
            LabeledContent {
                Text("\(targetAmount, specifier: "%.2f")")
            } label: {
                Text("USD")
            }
            .listRowSeparator(.hidden)
            
        }
        .listStyle(.plain)
        .navigationTitle("Convert")
    }
}

struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView(sourceCurrency: "UAH", sourceAmount: 150.30)
    }
}
