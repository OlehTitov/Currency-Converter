//
//  ContentView.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AllCurrenciesView()
                .tabItem {
                    Label("All currencies", systemImage: "dollarsign.circle")
                }
            
            MyCurrenciesView()
                .tabItem {
                    Label("My currencies", systemImage: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
