//
//  Result.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct Location: Decodable{
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: Array<String>?
    let url: String?
    let created: String?
}
