//
//  Banco.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import UIKit
import SwiftUI


class Artist: ObservableObject, Identifiable {
    var name: String
    var imageURL: String?
    var uri: String
    
    @Published var image: UIImage?
    
    init(name: String, imageURL: String, uri: String){
        self.name = name
        self.imageURL = imageURL
        self.uri = uri
    }
    

    func toSafariURL()->String{
        return "https://open.spotify.com/artist/" + self.uri.split(separator: ":").last!
    }
    
}

class ArtistsBank: ObservableObject, Identifiable{
    
    @Published var items: [Artist]?
    
    init() {
        self.clear()
        self.addItems()
        
    }
    func clear(){
        items = []
    }
    
    func addItems(){
        for artist in self.getArtists(){
            let item = artist
            items!.append(item)
            
            let index = items!.count - 1
            
            let request = URLRequest(url: URL(string: item.imageURL!)!)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let data = data else {
                        return
                    }
                    
                    if let image = UIImage(data: data){
                        self.items![index].image = image
                    }
                }
            }.resume()
        }
    }
    
}



















extension ArtistsBank{
    func getArtists() -> [Artist]{
        var artists: [Artist] = []
        artists.append(Artist(name: "Lady Gaga", imageURL: "https://i.scdn.co/image/1f4c23aa943d8eafc17e9f02e0cb1ffc3ac49d37", uri: "spotify:artist:1HY2Jd0NmPuamShAr6KMms"))
        artists.append(Artist(name: "Selvagens à Procura de Lei", imageURL: "https://i.scdn.co/image/e3016d89b171f6231def6599134021d9dc2d302f", uri: "spotify:artist:093ybF4c81CndQe6qWtc8S"))
        artists.append(Artist(name: "Rex Orange County", imageURL: "https://i.scdn.co/image/e85ed2c96c618b12433c7e6126ccb7771b469f3e", uri: "spotify:artist:7pbDxGE6nQSZVfiFdq9lOL"))
        artists.append(Artist(name: "Lana Del Rey", imageURL: "https://i.scdn.co/image/6e8dc460cfb6b89d7970302259febd0aa73b38c6", uri: "spotify:artist:00FQb4jTyendYWaN8pK0wa"))
        artists.append(Artist(name: "Tom Zé", imageURL: "https://i.scdn.co/image/03d250f957eb557725bf2c1c7e5e0ccc7b8192eb", uri: "spotify:artist:1gIa65d5ICT2xVWiUJ3u27"))
        artists.append(Artist(name: "Tove Lo", imageURL: "https://i.scdn.co/image/e088be208a6ded5ede7a8294792d2e877f03163d", uri: "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"))
        artists.append(Artist(name: "Sufjan Stevens", imageURL: "https://i.scdn.co/image/9980e58868196afe7b58aaef79f61441a8d2907e", uri: "spotify:artist:4MXUO7sVCaFgFjoTI5ox5c"))
        artists.append(Artist(name: "Labrinth", imageURL: "https://i.scdn.co/image/d9a7e54f8df26abde79fd1be03f40d4e8569f590", uri: "spotify:artist:2feDdbD5araYcm6JhFHHw7"))
        artists.append(Artist(name: "Cuco", imageURL: "https://i.scdn.co/image/221f225df17fc3378f4e1525198882b2b6c25978", uri: "spotify:artist:2Tglaf8nvDzwSQnpSrjLHP"))
        artists.append(Artist(name: "Rodrigo Alarcon", imageURL: "https://i.scdn.co/image/a7b4ad6914cdd00394bd91099e306d21c70fd21a", uri: "spotify:artist:6D3gtdoxrtRGO9ZDU5wWSQ"))
        artists.append(Artist(name: "Kevin Abstract", imageURL: "https://i.scdn.co/image/e64fcf7fe112187074845a9047b79bde2bcb9939", uri: "spotify:artist:07EcmJpfAday8xGkslfanE"))
        artists.append(Artist(name: "Caetano Veloso", imageURL: "https://i.scdn.co/image/ccd1961cd88033ba9047240cab7c862fdfd86c77", uri: "spotify:artist:7HGNYPmbDrMkylWqeFCOIQ"))
        artists.append(Artist(name: "Fiona Apple", imageURL: "https://i.scdn.co/image/0e8127b1cf85ed41361897d02aede5298749d3f8", uri: "spotify:artist:3g2kUQ6tHLLbmkV7T4GPtL"))
        artists.append(Artist(name: "Geraldo Azevedo", imageURL: "https://i.scdn.co/image/ffc53e8348fa53eefa82fa944dbd2e4c127aa343", uri: "spotify:artist:65TbyndeGrDlFd4IkZNfbN"))
        artists.append(Artist(name: "Cigarettes After Sex", imageURL: "https://i.scdn.co/image/074a07d0cbf2a30290b5b55b152952e3c7011341", uri: "spotify:artist:1QAJqy2dA3ihHBFIHRphZj"))
        artists.append(Artist(name: "Lolo Zouaï", imageURL: "https://i.scdn.co/image/b2618179ccf4729d0d4eec624f7e2d9b5ba719d0", uri: "spotify:artist:2qDIR2WlcW3llkGqJWg9VJ"))
        artists.append(Artist(name: "BROCKHAMPTON", imageURL: "https://i.scdn.co/image/c5d8db5b41cdf04a63ab8dc30c4f92a9b9005263", uri: "spotify:artist:1Bl6wpkWCQ4KVgnASpvzzA"))
        artists.append(Artist(name: "Mombojó", imageURL: "https://i.scdn.co/image/9df3c91da8c4f764459f91ed9d268b1c758cafc0", uri: "spotify:artist:2pbePWVNtbsPWxUgYg7a79"))
        artists.append(Artist(name: "Kim Petras", imageURL: "https://i.scdn.co/image/aa2f10401f80f09bad17e301f0526b1a5246c759", uri: "spotify:artist:3Xt3RrJMFv5SZkCfUE8C1J"))
        artists.append(Artist(name: "Frank Ocean", imageURL: "https://i.scdn.co/image/7db34c8aace6feb91f38601bb75e6b3301b4657a", uri: "spotify:artist:2h93pZq0e7k5yf4dywlkpM"))
        artists.append(Artist(name: "Academia da Berlinda", imageURL: "https://i.scdn.co/image/e098b4c7bbc9fa127bf108247c4e0156118d0c89", uri: "spotify:artist:2pG3gLX9VMIXtbSRxvNKjC"))
        artists.append(Artist(name: "BaianaSystem", imageURL: "https://i.scdn.co/image/80fe11fa7f41306d343d6a2005611c877bca073f", uri: "spotify:artist:5JHYuwE2n7bleXMUsmtCW5"))
        artists.append(Artist(name: "Ava Max", imageURL: "https://i.scdn.co/image/6e404ca4aeb865b17ca6bd5e36fd27b5aabc814a", uri: "spotify:artist:4npEfmQ6YuiwW1GpUmaq3F"))
        artists.append(Artist(name: "Tyler, The Creator", imageURL: "https://i.scdn.co/image/fe839f5bd121774e64f377b5eead237c69a01711", uri: "spotify:artist:4V8LLVI7PbaPR0K2TGSxFF"))
        artists.append(Artist(name: "Childish Gambino", imageURL: "https://i.scdn.co/image/2e1d974c14fb66eb5050bf3526c84c4f6e2f47ae", uri: "spotify:artist:73sIBHcqh3Z3NyqHKZ7FOL"))
        artists.append(Artist(name: "5 a Seco", imageURL: "https://i.scdn.co/image/740516883d56ef1e3d49960b45461425bcbd8c19", uri: "spotify:artist:1R9QfzgBmhk1spLg3BiU1f"))
        artists.append(Artist(name: "Lizzo", imageURL: "https://i.scdn.co/image/e33e4245fe5901ed940ba95070bb8d56679b6fe0", uri: "spotify:artist:56oDRnqbIiwx4mymNEv7dS"))
        artists.append(Artist(name: "Seu Pereira e Coletivo 401", imageURL: "https://i.scdn.co/image/ab67616d0000b273a4d817b31b1d16f815bd8b0a", uri: "spotify:artist:5dk0R5am4zMYmG6uyZwfkW"))
        artists.append(Artist(name: "Ryan Beatty", imageURL: "https://i.scdn.co/image/ecdb9caf205c2f02ca8accaea8d064c3e20e98af", uri: "spotify:artist:60NNvDqsif0u40CXMV6jDQ"))
        artists.append(Artist(name: "Billie Eilish", imageURL: "https://i.scdn.co/image/022d340319cc6c57ed953075f4c7a2d3346669af", uri: "spotify:artist:6qqNVTkY8uBg9cP3Jd7DAH"))
        artists.append(Artist(name: "Harry Styles", imageURL: "https://i.scdn.co/image/b2163e7456f3d618a0e2a4e32bc892d6b11ce673", uri: "spotify:artist:6KImCVD70vtIoJWnq6nGn3"))
        artists.append(Artist(name: "Leon Bridges", imageURL: "https://i.scdn.co/image/2ef080e352a66846b67fc5c57701e33d4942eae2", uri: "spotify:artist:3qnGvpP8Yth1AqSBMqON5x"))
        artists.append(Artist(name: "Chico César", imageURL: "https://i.scdn.co/image/7942e2f186b8a60f66518a9f1d3d5beb0afc1008", uri: "spotify:artist:3vlUveVfzPXzhiPGjHHxOH"))
        artists.append(Artist(name: "Skank", imageURL: "https://i.scdn.co/image/bbdaedcf66f3a3d424633484145e1d49cce9f612", uri: "spotify:artist:4C4kpaAdp6aKSkguw40SsU"))
        artists.append(Artist(name: "Lorde", imageURL: "https://i.scdn.co/image/d25fc756cd04c8b3ea196b7c07c6d057685cc405", uri: "spotify:artist:163tK9Wjr9P9DmM0AVK7lm"))
        artists.append(Artist(name: "Alceu Valença", imageURL: "https://i.scdn.co/image/4a17262959878fc185e89404fca7ce1a7e4b1288", uri: "spotify:artist:559vxOLTzlAv0zB77JMcdG"))
        artists.append(Artist(name: "Chico Buarque", imageURL: "https://i.scdn.co/image/c1a6ae9e79561abeb0bd97507cf7a26696469df0", uri: "spotify:artist:6tOsSffQQIXmK8TqsDck8t"))
        artists.append(Artist(name: "Dominic Fike", imageURL: "https://i.scdn.co/image/152c7aa25115e6ea1d3a65e90c35222ea80f73f8", uri: "spotify:artist:6USv9qhCn6zfxlBQIYJ9qs"))
        artists.append(Artist(name: "Johnny Hooker", imageURL: "https://i.scdn.co/image/2703eb8f9aaf48a3688218939716b343d1f927f5", uri: "spotify:artist:7qmf5YAQYjfjBF9C7kkjzs"))
        artists.append(Artist(name: "Liniker e os Caramelows", imageURL: "https://i.scdn.co/image/98d40fd69ee9aedd745c9271c49d61a20abdc838", uri: "spotify:artist:5ZtyHkAGvYFPSYcWPfmL5n"))
        artists.append(Artist(name: "girl in red", imageURL: "https://i.scdn.co/image/20050e95006ea5ec52f09c5dca97513a5b990319", uri: "spotify:artist:3uwAm6vQy7kWPS2bciKWx9"))
        artists.append(Artist(name: "Clairo", imageURL: "https://i.scdn.co/image/5e487c0d81c577c1736772d2542a2676004e0d87", uri: "spotify:artist:3l0CmX0FuQjFxr8SK7Vqag"))
        artists.append(Artist(name: "Daniel Caesar", imageURL: "https://i.scdn.co/image/f9dbecfbec79585821a0058c96fde9a57b9c106c", uri: "spotify:artist:20wkVLutqVOYrc0kxFs7rA"))
        artists.append(Artist(name: "Gilberto Gil", imageURL: "https://i.scdn.co/image/2d593dd8d1b6a16c09f297fc7cb0f6c54e63073d", uri: "spotify:artist:7oEkUINVIj1Nr3Wnj8tzqr"))
        artists.append(Artist(name: "Novos Baianos", imageURL: "https://i.scdn.co/image/779e7611e8509b5a625fa4a6f46cd5c81c2a7163", uri: "spotify:artist:2ohBjgFT9V0LRDWO2wF9DJ"))
        artists.append(Artist(name: "Ben Platt", imageURL: "https://i.scdn.co/image/66e9f9ffa9fc4e6d677b87b786dd943d50fc5aa7", uri: "spotify:artist:6qGkLCMQkNGOJ079iEcC5k"))
        artists.append(Artist(name: "Cage The Elephant", imageURL: "https://i.scdn.co/image/3f50bb245648f81ff86ac941e01b9912f5d9713d", uri: "spotify:artist:26T3LtbuGT1Fu9m0eRq5X3"))
        artists.append(Artist(name: "Still Woozy", imageURL: "https://i.scdn.co/image/86c32e84aab6272165902fdb2752ba0f99b26591", uri: "spotify:artist:4iMO20EPodreIaEl8qW66y"))
        artists.append(Artist(name: "Omar Apollo", imageURL: "https://i.scdn.co/image/559bfe18bc33ee21977ef1eebf02e3d836d8024c", uri: "spotify:artist:5FxD8fkQZ6KcsSYupDVoSO"))
        artists.append(Artist(name: "DUDA BEAT", imageURL: "https://i.scdn.co/image/59c463dd844f1207928992bedab0099db67ee059", uri: "spotify:artist:2QLSJqqGIstNbO6nYRR16o"))

        return artists
    }
}

