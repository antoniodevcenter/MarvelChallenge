//
//  CharacterNameTableViewCell.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharacterNameTableViewCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    var character : Character?
    var indexPath : IndexPath = IndexPath()
    let imagesDownloadManager = ImagesDownloadManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func cellIdentifier() -> String {
        return "CharacterNameTableViewCell"
    }
    
    func configureWith(character: Character, indexPath: IndexPath) {
        self.character = character
        self.indexPath = indexPath
        self.characterNameLabel.text = character.name
                
        imagesDownloadManager.downloadImage(url: createThumbnailString()) { (image) in
            if self.indexPath == indexPath {
                self.characterImage.image = image
                self.characterImage.backgroundColor = UIColor.clear
            }
        }
        
    }
    
    func createThumbnailString() -> String{
        return "\(character!.thumbnail.path!)/standard_medium.\(character!.thumbnail.thumbnailExtension!)"
    }
    
}
