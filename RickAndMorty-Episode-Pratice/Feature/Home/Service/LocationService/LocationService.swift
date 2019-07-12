//
//  LocationService.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation
import Alamofire

class LocationService {
    
    func getLocations(completion: @escaping (Swift.Result<Array<Location>, Error>) -> ()) {
        
        Alamofire.request("https://rickandmortyapi.com/api/location").response { response in
            do {
                guard let data = response.data else { return }
                
                let decoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                let locationResult = try decoder.decode(LocationResult.self, from: data)
                
                completion(.success(locationResult.locations ?? []))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}

