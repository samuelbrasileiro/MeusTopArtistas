//
//  ArtistView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 16/11/20.
//

import SwiftUI

/// A singular artist view containing its data
struct ArtistView: View{
    
    @ObservedObject var artist: Artist
    @State var isSelected: Bool = false
    
    @State var stroke: Color = Color.clear
    @State var foregroundColor: Color = Color(.systemPurple)
    @State var backgroundColor: Color = Color(.systemGray5)
    
    var body: some View{
        
        Button(action: {
            isSelected = !isSelected
            if isSelected{
                stroke = Color(.systemPurple)
                foregroundColor = Color(.systemGray5)
                backgroundColor = Color(.systemPurple)
            }
            else{
                stroke = .clear
                foregroundColor = Color(.systemPurple)
                backgroundColor = Color(.systemGray5)
            }
            
        }){
            
            if artist.name.count < 13 {
                (artist.image == nil ? Image(systemName: "person.circle.fill") : Image(uiImage: artist.image!))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(stroke, lineWidth: 5))
                    .cornerRadius(10)
                
            }
            else{
                
                Text(artist.name)
                    .padding()
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(10)
                
                if artist.previewURL != nil{
                    Link(destination: URL(string: artist.previewURL!)!){
                        Image(systemName: "play.fill")
                    }
                }
            }
        }
        
        
    }
    
    
}

struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView(artist: ArtistsBank().items![1])
        
    }
}

enum ItemType {
    case music
    case image
}

class DiscoverItem{
    var id: String
    var url: String?
    var type: ItemType
    
    init(id: String, type: ItemType){
        self.id = id
        self.type = type
    }
    
}

class MusicItem: DiscoverItem{
    var title: String?
    var artistName: String?
    
    var imageAlbumURL: String?
    var imageAlbum: UIImage?
    
    override init(id: String, type: ItemType) {
        super.init(id: id, type: type)
        
        
    }
    
    
}

class DiscoverBank{
    var items: [DiscoverItem] = []
    
    init(){
        items.append(MusicItem(id: "sssss", type: .music))
    }
    
}
