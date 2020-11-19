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
                
                //Text(artist.name)
                //    .padding()
                //    .background(backgroundColor)
                //    .foregroundColor(foregroundColor)
                //    .cornerRadius(10)
                
                if let music = artist.music{
                    MusicView(item: music)
                }
            }
        }
        
        
    }
    
    
}

struct MusicView: View{
    
    @ObservedObject var item: MusicItem
    
    @State var isSelected: Bool = false
    
    @State var stroke: Color = Color.clear
    @State var foregroundColor: Color = Color(.systemPurple)
    @State var backgroundColor: Color = Color(.systemGray5)
    
    var body: some View{
        if let name = item.title{
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
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(name)
                            .bold()
                            .lineLimit(2)
                            
                        Text(item.artistName!)
                            .font(.footnote)
                            .lineLimit(2)
                            
                    }
                    Spacer()
                    Button(action: {
                        
                    }){
                        Image(systemName: "play.fill")
                    }
                        
                }
                .padding()
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 100, alignment: .center)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
                
            }
        }
        
    }
}


struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView(artist: ArtistsBank().items![1])
        
    }
}

