//
//  CharacterService.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 02/07/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation
import Alamofire


class CharacterService {
    
    func getCharacters(completion: @escaping (Swift.Result<Array<Character>, Error>) -> ()) {
        
        Alamofire.request("https://rickandmortyapi.com/api/character").response { response in
            do {
                guard let data = response.data else { return }
                
                let decoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                let characterResult = try decoder.decode(CharacterResult.self, from: data)
                
                completion(.success(characterResult.characters ?? []))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}
