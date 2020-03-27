//
//  CharactersIndexTableViewController.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class CharactersIndexTableViewController: UITableViewController, CharactersIndexPresenterDelegate {

    private let presenter = CharactersIndexPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: IndexTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: IndexTableViewCell.cellIdentifier())

        self.presenter.initWithDelegate(delegate: self)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.sections.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : IndexTableViewCell = tableView.dequeueReusableCell(withIdentifier: IndexTableViewCell.cellIdentifier(), for: indexPath) as! IndexTableViewCell
        cell.configureWith(indexLetter: self.presenter.sections[indexPath.row])
        return cell
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
