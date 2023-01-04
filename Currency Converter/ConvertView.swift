//
//  ConvertView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct ConvertView: View {
    @EnvironmentObject private var model: Model
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
                                Task {
                                    targetAmount = await model.convert(from: sourceCurrency, to: "USD", amount: sourceAmount) ?? 0.00
                                }
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
                VStack {
                    if model.conversionInProgress {
                        ProgressView()
                    } else {
                        Text(String(format: "%.2f", targetAmount))
                    }
                }
            } label: {
                Text("USD")
            }
            .listRowSeparator(.hidden)
            
        }
        .font(.title3)
        .fontWeight(.bold)
        .listStyle(.plain)
        .navigationTitle("Convert")
        .toolbar(.hidden, for: .tabBar)
    }
}

struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView(sourceCurrency: "UAH", sourceAmount: 150.30)
    }
}
