//
//  CharacterResult.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation


struct CharacterResult: Decodable {
    let info: CharacterInfo?
    let characters: Array<Character>?
    
    enum CodingKeys: String,CodingKey{
        case info
        case characters = "results"
    }
    
}
