//
//  CharacterDetailViewController.swift
//  Marvel Challenge
//
//  Created by Antonio on 30/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    private let presenter = CharacterDetailPresenter()
    let imagesDownloadManager = ImagesDownloadManager()
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CharacterInfoTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CharacterInfoTableViewCell.cellIdentifier())
    }
    
    func configureWith(character: Character) {
        self.title = character.name
        self.presenter.getCharacterInfo(character: character, delegate: self)
    }
}

extension CharacterDetailViewController : CharacterDetailPresenterDelegate {

    func reloadView() {
        let imagePath = Thumbnail.createPath(thumbnail: presenter.character!.thumbnail, size: "landscape_incredible")
        imagesDownloadManager.downloadImage(url: imagePath) { (image) in
            self.characterImageView.image = image
            self.characterImageView.backgroundColor = UIColor.clear
        }
        self.tableView.reloadData()
    }
}

extension CharacterDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.character == nil {
            return 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CharacterInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTableViewCell.cellIdentifier(), for: indexPath) as! CharacterInfoTableViewCell
        cell.configureWith(character: presenter.character!)
        return cell
    }
    
    
}
