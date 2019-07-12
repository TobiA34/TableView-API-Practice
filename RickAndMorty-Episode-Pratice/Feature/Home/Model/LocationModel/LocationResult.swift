//
//  LocationResult.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct LocationResult: Decodable{
    let locations: Array<Location>?
    let locationInfo: LocationInfo?
    
    enum CodingKeys: String, CodingKey{
        case locationInfo
        case locations = "results"
    }
}
