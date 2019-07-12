//
//  Result.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct Episode: Decodable{
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: Array<String>?
    let url: String?
    let created: String?
}
