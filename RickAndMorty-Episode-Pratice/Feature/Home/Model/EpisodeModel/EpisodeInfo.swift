//
//  episodeService.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct EpisodeInfo: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
