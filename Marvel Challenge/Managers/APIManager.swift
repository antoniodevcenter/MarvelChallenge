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
    
    static func getCharacters(startingLetter: String, limit: UInt, offset: UInt, withCompletion completionHandler: @escaping (_ response: CharacterDataWrapper?, _ failure: Error?) -> Void) {
        let url = baseURL.appending("/characters")
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = getHashWith(timestamp: timestamp)
        
        let parameters : [String : Any] = ["limit" : limit,
                                           "offset" : offset,
                                           "nameStartsWith" : startingLetter,
                                           "apikey" : apiKey,
                                           "ts" : timestamp,
                                           "hash" : hash]
        
        ResponseParserManager.parseArrayOfCharacters(url: url, parameters: parameters) { (characterDataWrapper, error) in
            completionHandler(characterDataWrapper, error)
        }
    }
    
    static func getCharacterWith(id: Int, withCompletion completionHandler: @escaping (_ response: CharacterDataWrapper?, _ failure: Error?) -> Void) {
        let url = baseURL.appending("/characters")
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = getHashWith(timestamp: timestamp)
        
        let parameters: [String : Any] = ["id" : id,
                                          "apikey" : apiKey,
                                          "ts" : timestamp,
                                          "hash" : hash]
        
        ResponseParserManager.parseArrayOfCharacters(url: url, parameters: parameters) { (characterDataWrapper, error) in
            completionHandler(characterDataWrapper, error)
        }
        
    }
}

extension APIManager {
    static func getHashWith(timestamp: String) -> String {
        return "\(timestamp)\(privateKey)\(apiKey)".md5
    }
}
