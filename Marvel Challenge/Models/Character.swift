//
//  Character.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String?
    let urls: [URLElement]
    let thumbnail: Thumbnail
    let comics: Comics
    let stories: Stories
    let events, series: Comics
}
