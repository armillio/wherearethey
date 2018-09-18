//
//  ApplicationConstants.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

struct ApplicationConstants {

    #if DEBUG // DEVELOPMENT
    static let endpoint: Environment = .development
    #elseif RELEASE // APPSTORE
    static let endpoint: Environment = .production
    #endif
    static let APIBaseURL = endpoint.baseURL
    static let APIVersion = endpoint.version
    static let APIPublicKey = endpoint.publicKey
    static let APISecretKey = endpoint.secretKey
}
