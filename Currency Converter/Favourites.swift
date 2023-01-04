//
//  Favourites.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

class Favourites : ObservableObject {
    
    private var currencies : Array<String>
    
    private let saveKey = "Favorites"
    
    init() {
        let userDefaults = UserDefaults.standard
        self.currencies = userDefaults.stringArray(forKey: saveKey) ?? []
    }
    
    // returns true if our array contains this currency
    func contains(_ item: String) -> Bool {
        currencies.contains(item)
    }
    
    // adds the currency to our set, updates all views, and saves the change
    func add(_ item: String) {
        objectWillChange.send()
        currencies.insert(item, at: 0)
        print("Number of favourite projects after adding: \(currencies.count)")
        save()
    }
    
    //removes currency from favs
    func remove(_ item: String) {
        objectWillChange.send()
        currencies.removeAll(where: { $0 == item })
        print("Number of favourite projects after removing: \(currencies.count)")
        save()
    }
    
    func save() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(currencies, forKey: saveKey)
    }
}
