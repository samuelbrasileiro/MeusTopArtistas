//
//  SwiftUIView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

struct ArtistView: View{
    
    @ObservedObject var artist: Artist
    @State var fore: Color = Color.clear
    var body: some View{
        Button(action: {
            fore = .blue
        }){
            if artist.name.count < 13 {
            (artist.image == nil ? Image(systemName: "person.circle.fill") : Image(uiImage: artist.image!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(Rectangle().stroke(fore, lineWidth: 4))
            }
            else{
                Text(artist.name)
                    .padding()
                    .background(Color.green)
                    
            }
        }
        
            
    }
    
    
}

struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView(artist: ArtistsBank().items![0])
        
    }
}

struct ArtistsView: View {
    @ObservedObject var bank: ArtistsBank
    @State var numberOfColumns = 2
    var spacing: CGFloat = 8
    var sectionInset = EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    var body: some View{
        
            
            StaggeredLayoutList(data: bank.items!, numberOfColumns: self.numberOfColumns, horizontalSpacing: self.spacing, verticalSpacing: self.spacing, sectionInsets: sectionInset) {artist in
                ArtistView(artist: artist)
            }
            
    }
    
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(bank: ArtistsBank())
    }
}

