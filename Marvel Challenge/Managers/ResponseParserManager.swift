//
//  ResponseParserManager.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import Alamofire

class ResponseParserManager {

    static func parseArrayOfCharacters(url: String,
                                       parameters: [String : Any],
                                       withCompletion completionHandler: @escaping (_ response: CharacterDataWrapper?, _ error: Error?) -> Void) {
        
        ConnectionManager.connectWith(url: url, params: parameters) { (dataResponse) in
            do {
                let characters = try JSONDecoder().decode(CharacterDataWrapper.self, from: (dataResponse?.data)!)
                completionHandler(characters, nil)
                
            } catch {
                completionHandler(nil, error)
            } 
        }
    }
    
    
}

