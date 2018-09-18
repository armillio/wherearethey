//
//  Environments.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

enum Environment {
    case development
    case production

    var description: String {
        switch self {
        case .development:
            return "Development"
        case .production:
            return "Production"
        }
    }

    var baseURL: String {
        switch self {
        case .development:
            return ""
        case .production:
            return ""
        }
    }

    var version: String {
        return "1.0"
    }

    var publicKey: String {
        switch self {
        case .development:
            return ""
        case .production:
            return ""
        }
    }

    var secretKey: String {
        switch self {
        case .development:
            return ""
        case .production:
            return ""
        }
    }
}
