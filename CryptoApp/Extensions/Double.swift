//
//  Double.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 13.03.2022.
//

import Foundation

extension Double {
    
    /// Convert a Double into a Currentsy with 2 decimal places
    /// ```
    /// Convert 1234.56 to $ 1,234.56
    /// ```
    private var currentcyFormatter2: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        // formater.locale = .current // <- default value
        // formater.currencyCode = "usd" // <- change currentcy
        // formater.currencySymbol = "$" // <- change currentcy
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }
    
    
    /// Convert a Double into a Currentsy as a String 2 decimal places
    /// ```
    /// Convert 1234.56 to $ "1,234.56"
    /// ```
    func asCurrentsyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currentcyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Convert a Double into a Currentsy with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ 1,234.56
    /// Convert 12.3456 to $ 12.3456
    /// Convert 0.123456 to $ 0.123456
    /// ```
    private var currentcyFormatter6: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        // formater.locale = .current // <- default value
        // formater.currencyCode = "usd" // <- change currentcy
        // formater.currencySymbol = "$" // <- change currentcy
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        return formater
    }
    
    
    /// Convert a Double into a Currentsy as a String 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ "1,234.56"
    /// Convert 12.3456 to $ "12.3456"
    /// Convert 0.123456 to $ "0.123456"
    /// ```
    func asCurrentsyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currentcyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Convert a Double into String representation
    /// ```
    /// Convert 1.23456 to $ "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Convert a Double into String representation with percent symbol
    /// ```
    /// Convert 1.23456 to $ "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
