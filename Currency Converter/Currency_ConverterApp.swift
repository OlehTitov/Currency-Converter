//
//  Currency_ConverterApp.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import SwiftUI

@main
struct Currency_ConverterApp: App {
    let model = Model()
    let favourites = Favourites()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(favourites)
        }
    }
}
