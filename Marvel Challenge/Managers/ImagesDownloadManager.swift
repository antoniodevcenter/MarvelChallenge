//
//  ImagesDownloadManager.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ImagesDownloadManager {
    
    func downloadImage(url: String, withCompletion completionHandler: @escaping (_ response: UIImage?) -> Void) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let imageCache = AutoPurgingImageCache()
        
        guard let myImageToFetch = imageCache.image(for: urlRequest, withIdentifier: url) else {
            Alamofire.request(url).responseImage { response in
                guard let image = response.result.value else {
                    return
                }
                imageCache.add(image, for: urlRequest, withIdentifier: url)
                completionHandler(image)
            }
            return
        }
        completionHandler(myImageToFetch)
    }
    
}
