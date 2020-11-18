//
//  SearchSong.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 17/11/20.
//

import Foundation

// MARK: - SearchSong
class SearchSong: Codable {
    let results: SearchSongResults?
    let meta: Meta?

    init(results: SearchSongResults?, meta: Meta?) {
        self.results = results
        self.meta = meta
        
    }
    
    /// From a search in Apple Music of the Artist's Name it returns a result containing one artist's song data
    /// - Parameters:
    ///   - artistName: The artist name
    ///   - completion: Block of asyncronous code that is processed at the end of the fetch
    class func fetchBy(artistName: String, completion: @escaping (Result<Song,Error>) -> Void){
        
        let artistNameEncoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        print(artistNameEncoded ?? "")
        
        let url = URL(string: "https://api.music.apple.com/v1/catalog/br/search?types=songs&limit=1&term=" + artistNameEncoded!)!
        var request = URLRequest(url: url)
        request.setValue("Bearer " + musicAcessTokenKey, forHTTPHeaderField: "Authorization")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let search = try JSONDecoder().decode(SearchSong.self, from: data)
                
                DispatchQueue.main.async {
                    let songs = search.results!.songs!
                    completion(.success(songs))
                }
                
                
            } catch let error {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}

// MARK: - Meta
class Meta: Codable {
    let results: MetaResults?

    init(results: MetaResults?) {
        self.results = results
    }
}

// MARK: - MetaResults
class MetaResults: Codable {
    let order: [String]?

    init(order: [String]?) {
        self.order = order
    }
}

// MARK: - SearchSongResults
class SearchSongResults: Codable {
    let songs: Song?

    init(songs: Song?) {
        self.songs = songs
    }
}
