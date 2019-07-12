//
//  CharacterViewController.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let characterService = CharacterService()
    private var datasource: Array<Character> = [] {
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableView()
    }
    
}


extension CharacterViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.cellID, for: indexPath) as? CharacterTableViewCell
        cell?.configure(with: character)
        return cell!
    }
    
}

private extension CharacterViewController {
    
    func updateTableView(){
        setupTableView()
        getAllCharacters()
    }
    
    func setupTableView(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: "CharacterTableViewCell" ,bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.cellID)
        
    }
    
    
    func getAllCharacters(){
        
        characterService.getCharacters { res in
            switch res {
            case .success(let characters):
                self.datasource = characters
            case .failure(let error):
                print("Failed to fetch courses:", error)
            }
        }
    }
    
}


