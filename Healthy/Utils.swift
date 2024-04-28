//
//  Utils.swift
//  Healthy
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation

extension Date {
    public static func currentTimeMillis() -> UInt64 {
        let timeInMillis = UInt64(NSDate().timeIntervalSince1970 * 1000.0)
        return timeInMillis
    }
    
    var milliseconds: UInt64 {
        get {
            return UInt64(self.timeIntervalSince1970 * 1000.0)
        }
    }
    
    public init(timeInMillis: UInt64) {
        self = Date(timeIntervalSince1970: TimeInterval(timeInMillis / 1000))
    }
}
