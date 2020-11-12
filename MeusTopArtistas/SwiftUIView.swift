//
//  SwiftUIView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

struct ArtistView: View{
    
    var body: some View{
        Text("Item de um artista")
    }
    
}

struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView()
        
    }
}

struct ArtistsView: View {
    
    var body: some View{
        Text("Lista de todos os artistas")
        
    }
    
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView()
    }
}

