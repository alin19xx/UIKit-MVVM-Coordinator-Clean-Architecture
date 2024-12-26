//
//  XLogger.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol XLogger {
    func log(message: String, level: LogLevel)
}

enum LogLevel: String {
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
    case debug = "DEBUG"
    
    var icon: String {
        switch self {
        case .info:
            return "ℹ️"
        case .warning:
            return "⚠️"
        case .error:
            return "‼️"
        case .debug:
            return "🐛"
        }
    }
}

class NetworkingLogger: XLogger {
    func log(message: String, level: LogLevel) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .long)
        print("\(timestamp) 📡 [Networking] \(level.icon) [\(level.rawValue)] \(message)")
    }
}
