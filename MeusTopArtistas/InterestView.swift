//
//  InterestView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 16/11/20.
//

import SwiftUI

struct InterestView: View{
    @ObservedObject var artist: Artist
    
    @State var isSelected: Bool = false
    @State var foregroundColor: Color = Color(.systemGray)
    @State var backgroundColor: Color = Color(.systemGray5)
    
    var body: some View{
        Button(action: {
            isSelected = !isSelected
            if isSelected{
                foregroundColor = Color(.systemBackground)
                backgroundColor = Color(.systemPurple)
            }
            else{
                foregroundColor = Color(.systemGray)
                backgroundColor = Color(.systemGray5)
            }
        }){
           
        Text(artist.name)
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(10)
        }
    }
}

struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            InterestView(artist: ArtistsBank().items![0])
                
                
        }
    }
}
