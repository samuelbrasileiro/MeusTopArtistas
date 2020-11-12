//
//  SwiftUIView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

protocol ArtistsDelegate{
    func removeItem(at index: Int)
}
struct ArtistView: View{
    
    @ObservedObject var artist: Artist
    var index: Int
    var delegate : ArtistsDelegate?
    
    var body: some View{
        //1
        HStack(alignment: .center, spacing: 6){
            Spacer()
            //7
            Link(destination: URL(string: artist.uri)!){
                //4
                (artist.image == nil ?
                    //2
                    Image(systemName: "person.circle.fill") : Image(uiImage: artist.image!))
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                //3
                Text("\(index + 1). " + artist.name)
                    .font(.system(size: 27, weight: .bold, design: .rounded))
                    .foregroundColor(Color(.black))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            }
            //6
            Spacer(minLength: 10)
            //5
            Button(action: {
                //extra
                delegate?.removeItem(at: index)
            }){
                
                Image(systemName: "multiply.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: 20, minHeight: 0, maxHeight: 20, alignment: .leading)
                    .foregroundColor(Color(.black))
            }
            //DEPOIS SO
            Spacer(minLength: 10)
        }
        
        
    }
}

struct ArtistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistView(artist: ArtistsBank().items![0], index: 0)
        
    }
}

struct ArtistsView: View, ArtistsDelegate {
    
    //1
    @ObservedObject var bank: ArtistsBank
    
    func removeItem(at index: Int) {
        bank.items?.remove(at: index)
    }
    
    var body: some View{
            //2
            ScrollView {
                //3
                LazyVStack(alignment: .center, spacing: 8) {
                    //4
                    ForEach((0..<bank.items!.count), id: \.self){ index in
                        
                        ArtistView(artist: bank.items![index], index: index, delegate: self)
                        
                        Divider()
                    }
                }
                
                
            }
        
    }
    
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(bank: ArtistsBank())
        
    }
}

