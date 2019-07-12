//
//  ViewController.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let episodeService = EpisodeService()

    private var datasource: Array<Episode> = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTableView()
    }
    
}


extension EpisodeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID, for: indexPath) as? EpisodeTableViewCell
        cell?.configure(with: episode)
        return cell!
    }
    
    
}

private extension EpisodeViewController{
    
    func updateTableView(){
        setupTableView()
        getAllEpisodes()
    }
    
    func setupTableView(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: "EpisodeTableViewCell" ,bundle: nil), forCellReuseIdentifier: EpisodeTableViewCell.cellID)
        
    }
    
    
    func getAllEpisodes(){
        episodeService.getEpisodes { res in
            switch res{
            case .success(let episodes):
                self.datasource = episodes
            case .failure(let error):
                print("Failed to fetch episodes:", error)
            }
        }
    }
    
}
