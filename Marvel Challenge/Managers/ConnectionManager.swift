//
//  ConnectionManager.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import Alamofire

class ConnectionManager: NSObject {
    
    static func connectWith(url: String, params: [String : Any]?, withCompletion completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {

        
        Alamofire.request(url, parameters: params).responseJSON { (response)  -> Void in
            completionHandler(response)
        }
    }
}
