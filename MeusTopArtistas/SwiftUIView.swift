//
//  SwiftUIView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

struct ArtistImageView: View{
    @ObservedObject var artist: Artist
    
    var body: some View{
        (artist.image == nil ?
            Image(systemName: "person.circle.fill") : Image(uiImage: artist.image!))
            .resizable()
            .foregroundColor(Color(.black))
            .frame(minWidth: 0, maxWidth: 40, minHeight: 0, maxHeight: 40, alignment: .leading)
            .aspectRatio(contentMode: .fill)
    }
}



struct ArtistsView: View {
    
    @ObservedObject var bank: ArtistsBank
    
    
    var body: some View{
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8) {
            Spacer()
            Button(action: {
                bank.clear()
                bank.addItems()
                
            }){
                Text("Meus Top Artistas")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            .foregroundColor(Color(.orange))
            .padding()
            .background(Color(.black))
            .cornerRadius(10)
            
            Spacer(minLength: 10)
            
            ScrollView {
                LazyVStack(alignment: .center, spacing: 8) {
                    
                    ForEach((0..<bank.items!.count), id: \.self){ index in
                        HStack(alignment: .center, spacing: 6){
                            Spacer()
                            Link(destination: URL(string: bank.items![index].uri)!){
                                
                                //(bank.items![index].image == nil ?
                                //Image(systemName: "person.circle.fill") : Image(uiImage: bank.items![index].image!))
                                ArtistImageView(artist: bank.items![index])
                                
                                Text("\(index + 1). " + bank.items![index].name)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundColor(Color(.black))
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                            }
                            Spacer(minLength: 10)
                            Button(action: {
                                bank.items!.remove(at: index)
                            }){
                                
                                Image(systemName: "multiply.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(minWidth: 0, maxWidth: 20, minHeight: 0, maxHeight: 20, alignment: .leading)
                                    .foregroundColor(Color(.black))
                            }
                            Spacer(minLength: 10)
                        }
                        Divider()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color(.orange))
            }.navigationBarTitle("Meus Top Artistas", displayMode: .inline)
            
        }.background(Color(.orange))
        
        
    }
    
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(bank: ArtistsBank())
    }
}

