//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 20.03.2022.
//

import Foundation

struct StaticticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
        
    }
    
}
