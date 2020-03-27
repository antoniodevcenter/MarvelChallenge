//
//  APIManager.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

class APIManager: NSObject {

    static let baseURL = "https://gateway.marvel.com:443/v1/public"
    
    static func getCharacters(limit: UInt, offset: UInt) {
        let url = baseURL.appending("/characters")
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = getHashWith(timestamp: timestamp)
        
        let parameters : [String : Any] = ["limit" : limit,
                                           "offset" : offset,
                                           "apikey" : apiKey,
                                           "ts" : timestamp,
                                           "hash" : hash]
        
        ResponseParserManager.parseArrayOfCharacters(url: url, parameters: parameters) { (characterDataWrapper, error) in
            
        }
    }
    
    static func getHashWith(timestamp: String) -> String {
        return "\(timestamp)\(privateKey)\(apiKey)".md5
    }
}
