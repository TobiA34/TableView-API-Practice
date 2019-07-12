//
//  CharacterTableViewCell.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    static let cellID = "CharacterTableViewCell"
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterNameLbl: UILabel!
    
    func configure(with character: Character){
        characterNameLbl.text = character.name
        characterImageView.kf.indicatorType = .activity
        characterImageView.kf.setImage(with: URL(string: character.image ?? ""))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        characterNameLbl.text = nil
    }
    
    
}
