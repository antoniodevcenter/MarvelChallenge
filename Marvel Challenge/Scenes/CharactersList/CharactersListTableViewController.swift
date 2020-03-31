//
//  CharactersListTableViewController.swift
//  Marvel Challenge
//
//  Created by Antonio on 27/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharactersListTableViewController: UITableViewController, CharactersListPresenterDelegate {
    
    private let presenter = CharactersListPresenter()

    var startingLetter: String?
    var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CharacterNameTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CharacterNameTableViewCell.cellIdentifier())
        tableView.tableFooterView = UIView()
        
        loadingView = LoadingView(parentView: self.view)
    }
    
    public func configureFor(startingLetter: String) {
        presenter.configureForLetter(letter: startingLetter, delegate: self)
        self.title = startingLetter
    }

    // MARK: - Presenter Delegate
    
    func setStartingLetter(startingLetter: String?) {
        self.startingLetter = startingLetter
    }
    
    func updateCharactersArray(arrayOfCharacters: [Character]?, error: Error?) {
        self.tableView.reloadData()
        loadingView?.hideLoadingView()
    }
    
    func goToCharacterDetail(id: Int) {
        performSegue(withIdentifier: "goToCharacterDetailFromCharactersList", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToCharacterDetailFromCharactersList" {
            let characterDetailViewController : CharacterDetailViewController = segue.destination as! CharacterDetailViewController
            characterDetailViewController.configureWith(character: self.presenter.selectedCharacter!)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.arrayOfCharacters.count
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CharacterNameTableViewCell = tableView.dequeueReusableCell(withIdentifier: CharacterNameTableViewCell.cellIdentifier(), for: indexPath) as! CharacterNameTableViewCell
        cell.configureWith(character: presenter.arrayOfCharacters[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let character = presenter.arrayOfCharacters[indexPath.row]
        presenter.didSelect(character: character)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.arrayOfCharacters.count - 10 {
            presenter.getCharactersFor(startingLetter: self.startingLetter!, limit: presenter.limit, offset: presenter.offset)
        }
    }
}
