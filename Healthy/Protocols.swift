//
//  Protocols.swift
//  Healthy
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation
import LoggerAPI

public enum InvalidDataError: Error {
    case deserialization(String)
    case serialization(String)
}

public enum State: String {
    case UP
    case DOWN
}

public class StatusDateFormatter {
    private let dateFormatter: DateFormatter
    
    init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let timeZone = TimeZone(identifier: "UTC") {
            self.dateFormatter.timeZone = timeZone
        } else {
            Log.warning("UTC time zone not found.")
        }
    }
    
    public func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    public func date(from string: String) -> Date? {
        return dateFormatter.date(from: string)
    }
    
    var dateFormat: String {
        get {
            return self.dateFormatter.dateFormat
        }
    }
}

public struct Status: Equatable {
    public static let dateFormatter = StatusDateFormatter()
    
    public static var dateFormat: String {
        get {
            return dateFormatter.dateFormat
        }
    }
    
    public let state: State
    
    public let details: [String]
    
    public var tsInMillis: UInt64 {
        get {
            let date = Status.dateFormatter.date(from: timestamp)
            return date!.milliseconds
        }
    }
    
    public let timestamp: String
}
