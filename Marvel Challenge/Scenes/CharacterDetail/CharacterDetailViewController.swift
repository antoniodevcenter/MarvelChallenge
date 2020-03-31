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
    var loadingView: LoadingView?
    var url: String?
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CharacterInfoTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CharacterInfoTableViewCell.cellIdentifier())
        tableView.register(UINib(nibName: CharacterPublicationTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CharacterPublicationTableViewCell.cellIdentifier())
        tableView.tableFooterView = UIView()
        loadingView = LoadingView(parentView: self.view)
    }
    
    //MARK: - Controller configuration
    
    func configureWith(character: Character) {
        self.title = character.name
        self.presenter.getCharacterInfo(character: character, delegate: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebViewFromCharacterDetail" {
            let webViewController : WebViewController = segue.destination as! WebViewController
            webViewController.configureWith(url: self.url!)
        }
    }
}

extension CharacterDetailViewController : CharacterDetailPresenterDelegate {

    func reloadView() {
        loadingView?.hideLoadingView()
        let imagePath = Thumbnail.createPath(thumbnail: presenter.character!.thumbnail, size: "landscape_incredible")
        imagesDownloadManager.downloadImage(url: imagePath) { (image) in
            self.characterImageView.image = image
            self.characterImageView.backgroundColor = UIColor.clear
        }
        self.tableView.reloadData()
    }
}

extension CharacterDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            let urlElement = self.presenter.character?.urls[indexPath.row]
            self.url = urlElement?.url
            self.performSegue(withIdentifier: "goToWebViewFromCharacterDetail", sender: self)
        }
    }
}

extension CharacterDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if presenter.character == nil {
            return 0
        } else {
            switch section {
            case 0:
                return 1
            case 1:
                return (self.presenter.character?.urls.count)!
            case 2:
                return self.presenter.character!.comics.items!.count
            case 3:
                return self.presenter.character!.stories.items!.count
            case 4:
                return self.presenter.character!.events.items!.count
            case 5:
                return self.presenter.character!.series.items!.count
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell : CharacterInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTableViewCell.cellIdentifier(), for: indexPath) as! CharacterInfoTableViewCell
            cell.configureWith(character: presenter.character!)
            return cell
        }
        let cell: CharacterPublicationTableViewCell = tableView.dequeueReusableCell(withIdentifier: CharacterPublicationTableViewCell.cellIdentifier(), for: indexPath) as! CharacterPublicationTableViewCell
        if indexPath.section == 1 {
            cell.configureWith(url: (presenter.character?.urls[indexPath.row])!)
        } else if indexPath.section == 2 {
            cell.configureWith(comic: (presenter.character?.comics.items![indexPath.row])!)
        } else if indexPath.section == 3 {
            cell.configureWith(story: (presenter.character?.stories.items![indexPath.row])!)
        } else if indexPath.section == 4 {
            cell.configureWith(comic: (presenter.character?.events.items![indexPath.row])!)
        } else if indexPath.section == 5 {
            cell.configureWith(comic: (presenter.character?.series.items![indexPath.row])!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Information".localized()
        case 1:
            return "URLs".localized()
        case 2:
            return "Comics".localized()
        case 3:
            return "Stories".localized()
        case 4:
            return "Events".localized()
        case 5:
            return "Series".localized()
        default:
            return ""
        }
    }
}
