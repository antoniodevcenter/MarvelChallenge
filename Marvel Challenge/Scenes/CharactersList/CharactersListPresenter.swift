//
//  CharactersListPresenter.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

protocol CharactersListPresenterDelegate: NSObjectProtocol {
    func setStartingLetter(startingLetter: String?)
    func updateCharactersArray(arrayOfCharacters: [Character]?, error: Error?)
}

class CharactersListPresenter {
    
    weak private var delegate : CharactersListPresenterDelegate?
    
    var arrayOfCharacters: [Character] = [Character]()
    var startingLettter: String?
    var limit: UInt = 20
    var offset: UInt = 0
    var moreItemsToDownload = true
    
    func getCharactersFor(startingLetter: String, limit: UInt, offset: UInt) {
        
        guard moreItemsToDownload == true else {
            return
        }
        APIManager.getCharacters(startingLetter: startingLetter, limit: limit, offset: offset) {
            (characterDataWrapper, error) in
            
            guard error == nil else {
                return
            }
            self.offset = self.offset + 20
            self.arrayOfCharacters.append(contentsOf: (characterDataWrapper?.data.characters)!)
            if (characterDataWrapper?.data.total)! <= Int(offset) {
                self.moreItemsToDownload = false
            }
            self.delegate?.updateCharactersArray(arrayOfCharacters: self.arrayOfCharacters, error: error)
        }
    }
    
    func configureForLetter(letter: String, delegate: CharactersListPresenterDelegate) {
        self.delegate = delegate
        self.startingLettter = letter
        self.delegate?.setStartingLetter(startingLetter: letter)
        self.getCharactersFor(startingLetter: letter, limit: limit, offset: offset)
    }
    
}
