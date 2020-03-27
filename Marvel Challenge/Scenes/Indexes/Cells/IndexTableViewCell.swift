//
//  IndexTableViewCell.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    var letter : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func cellIdentifier() -> String {
        return "IndexTableViewCell"
    }
    
    func configureWith(indexLetter: String) {
        self.letter = indexLetter
        titleLabel.text = "Personajes que empiezan por \(indexLetter)"
    }
    
}
