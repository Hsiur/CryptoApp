//
//  String.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 06.04.2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
