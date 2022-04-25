//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 20.03.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
