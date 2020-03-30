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
                return
            }

            self.character = characterDataWrapper!.data.characters[0]
            self.delegate?.reloadView()
        }
    }
}
