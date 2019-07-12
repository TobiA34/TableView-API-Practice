//
//  episodeTableViewCell.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    static let cellID = "episodeTableViewCell"
    @IBOutlet weak var episodeNameLbl: UILabel!
    
    func configure(with episode: Episode){
        episodeNameLbl.text = episode.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeNameLbl.text = nil
    }
    
}
