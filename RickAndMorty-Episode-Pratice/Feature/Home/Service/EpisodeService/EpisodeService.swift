//
//  episodeService.swift
//  RickAndMorty-Episode-Pratice
//
//  Created by Tobi Adegoroye on 30/06/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation
import Alamofire

class EpisodeService {
    func getEpisodes(completion: @escaping (Swift.Result<Array<Episode>, Error>) -> Void){
        Alamofire.request("https://rickandmortyapi.com/api/episode/").response { response in
            do{
                guard let data = response.data else { return }
                let decoder = JSONDecoder()
                let episodeResult = try decoder.decode(EpisodeResult.self, from: data)
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                completion(.success(episodeResult.episodes ?? []))
                
            }catch let jsonError{
                completion(.failure(jsonError))
            }
        }
    }
}
