//
//  LocationViewController.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let locationService = LocationService()
    private var datasource: Array<Location> = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableView()
    }
    
}


extension LocationViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.cellID, for: indexPath) as? LocationTableViewCell
        cell?.configure(with: location)
        return cell!
    }
    
    
    
}




private extension LocationViewController{
    
    func updateTableView(){
        setupTableView()
        getAllLocations()
    }
    
    func setupTableView(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: "LocationTableViewCell" ,bundle: nil), forCellReuseIdentifier: LocationTableViewCell.cellID)
        
    }
    
    
    func getAllLocations(){
        locationService.getLocations { res in
            switch res{
            case .success(let loactions):
                self.datasource = loactions
            case .failure(let error):
                print("Failed to fetch episodes:", error)
            }
        }
    }
    
}

