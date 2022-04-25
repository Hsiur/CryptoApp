//
//  Date.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 30.03.2022.
//

import Foundation

extension Date {
    
    init(coinGeckoString: String) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formater.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShotDateString() -> String {
        return shortFormater.string(from: self)
    }
}
