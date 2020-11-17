//
//  MusicView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 17/11/20.
//

import SwiftUI

struct MusicView: View {
    @State var mj = ""
    @ObservedObject var artist: Artist
    var body: some View {
        Text(mj)
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(artist: ArtistsBank().items![0])
    }
}
