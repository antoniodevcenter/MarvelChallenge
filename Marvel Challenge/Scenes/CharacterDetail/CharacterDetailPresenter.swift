//
//  CharacterDetailPresenter.swift
//  Marvel Challenge
//
//  Created by Antonio on 30/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

protocol CharacterDetailPresenterDelegate: NSObjectProtocol {
    func reloadView()
}


class CharacterDetailPresenter {
    
    weak private var delegate: CharacterDetailPresenterDelegate?
    
    var character: Character?
    var characterId: Int?
    
    func getCharacterInfo(character: Character, delegate: CharacterDetailPresenterDelegate) {

        self.character = character
        self.delegate = delegate
        
        APIManager.getCharacterWith(id: character.id!) { (characterDataWrapper, error) in

            guard error == nil else {
                // Error Handling
                return
            }

            self.character = characterDataWrapper!.data.characters[0]
            self.delegate?.reloadView()
        }
    }
    
    func getNumberOfSections() -> Int {
        var numberOfSections = 1
        if (self.character?.comics.items!.count)! > 0 {
            numberOfSections = numberOfSections + 1
        }
        if (self.character?.stories.items!.count)! > 0 {
            numberOfSections = numberOfSections + 1
        }
        if (self.character?.events.items!.count)! > 0 {
            numberOfSections = numberOfSections + 1
        }
        if (self.character?.series.items!.count)! > 0 {
            numberOfSections = numberOfSections + 1
        }
        if (self.character?.urls.count)! > 0 {
            numberOfSections = numberOfSections + 1
        }
        return numberOfSections
    }
}
