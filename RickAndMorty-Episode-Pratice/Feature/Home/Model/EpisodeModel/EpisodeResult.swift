//
//  EpisodeResult.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct EpisodeResult: Decodable{
    let episodes: Array<Episode>?
    let info: EpisodeInfo?
    
    enum CodingKeys: String,CodingKey{
        case info
        case episodes = "results"
    }
}
