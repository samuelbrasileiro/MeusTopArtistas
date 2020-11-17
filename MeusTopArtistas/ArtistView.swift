//
//  ArtistView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 16/11/20.
//

import SwiftUI

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
                
                
            }
        }
        
        
    }
    
    
}

struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView(artist: ArtistsBank().items![0])
        
    }
}
