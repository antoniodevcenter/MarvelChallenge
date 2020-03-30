//
//  CharactersIndexPresenter.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

protocol CharactersIndexPresenterDelegate: NSObjectProtocol {
    func performSegue()
}

class CharactersIndexPresenter {
    
    weak private var delegate: CharactersIndexPresenterDelegate?
    var sections = Array<String>()
    var selectedIndexLetter: String?
    
    func initWithDelegate(delegate: CharactersIndexPresenterDelegate?) {
        self.delegate = delegate
        self.initArrayOfIndexes()
    }
    
    private func initArrayOfIndexes() {
        sections = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "3"]
    }
    
    func setSelectedIndexLetter(indexLetter: String) {
        self.selectedIndexLetter = indexLetter
        self.delegate!.performSegue()
    }
}
