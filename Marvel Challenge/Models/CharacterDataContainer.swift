//
//  CharacterDataContainer.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

struct CharacterDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case characters = "results"
    }
}
