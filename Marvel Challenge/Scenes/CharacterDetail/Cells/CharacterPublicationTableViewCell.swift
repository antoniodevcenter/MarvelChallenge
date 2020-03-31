//
//  CharacterPublicationTableViewCell.swift
//  Marvel Challenge
//
//  Created by Antonio on 30/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharacterPublicationTableViewCell: UITableViewCell {

    @IBOutlet weak var publicationNameLabel: UILabel!
    
    var comic: Comic?
    var story: Story?
    var url: URLElement?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func cellIdentifier() -> String {
        return "CharacterPublicationTableViewCell"
    }
    
    func configureWith(comic: Comic) {
        self.comic = comic
        self.publicationNameLabel.text = comic.name
        self.accessoryType = .none
    }
    
    func configureWith(story: Story) {
        self.story = story
        self.publicationNameLabel.text = story.name
        self.accessoryType = .none
    }
    
    func configureWith(url: URLElement) {
        self.url = url
        self.publicationNameLabel.text = url.type
        self.accessoryType = .disclosureIndicator
    }
    
}
