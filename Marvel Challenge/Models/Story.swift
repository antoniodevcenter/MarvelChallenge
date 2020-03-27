//
//  Story.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

struct Stories: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [Story]?
}

// MARK: - StoriesItem
struct Story: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}
