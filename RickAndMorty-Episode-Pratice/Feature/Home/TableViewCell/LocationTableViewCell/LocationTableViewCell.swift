//
//  LocationTableViewCell.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit
import Kingfisher

class LocationTableViewCell: UITableViewCell {
    static let cellID = "LocationTableViewCell"
    @IBOutlet weak var locationNameLbl: UILabel!
    
    
    func configure(with location: Location){
        locationNameLbl.text = location.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         locationNameLbl.text = nil
    }
    
    
}
