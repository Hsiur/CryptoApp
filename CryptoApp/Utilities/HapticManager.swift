//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 24.03.2022.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
