//
//  CharacterInfoTableViewCell.swift
//  Marvel Challenge
//
//  Created by Antonio on 30/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharacterInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func cellIdentifier() -> String {
        return "CharacterInfoTableViewCell"
    }
    
    func configureWith(character: Character) {
        self.characterNameLabel.text = character.name
        
        if character.description == "" || character.description == nil {
            self.characterDescriptionLabel.text = "no description available"
        } else {
            self.characterDescriptionLabel.text = character.description
        }
    }
    
}
