//
//  SwiftUIView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

/// Our main view
struct ArtistsView: View {
    @ObservedObject var bank: ArtistsBank
    @State var numberOfColumns = 2
    var spacing: CGFloat = 8
    var sectionInset = EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    var body: some View{
        
        VStack{
            SearchBarView(bank: bank)
            if bank.isSearching {
                
                List {
                    // Filtered list of names
                    ForEach((0..<bank.items!.count).filter{bank.items![$0].name.hasPrefix(bank.searchText) || bank.searchText == ""}, id:\.self) { index in
                        Button(action:{
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.bank.searchText = ""
                            self.bank.isSearching = false
                        }){
                        Text(bank.items![index].name)
                        }
                    }
                }
                .resignKeyboardOnDragGesture()
            }
            else{
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(0..<bank.items!.count, id: \.self){ index in
                            InterestView(artist: bank.items![index])
                        }
                    }.frame(height: 50)
                    .padding(.leading)
                }
                
                StaggeredLayoutList(data: bank.items!, numberOfColumns: self.numberOfColumns, horizontalSpacing: self.spacing, verticalSpacing: self.spacing, sectionInsets: sectionInset) { artist in
                    ArtistView(artist: artist)
                }.background(Color(.systemGray6))
                
            }
        }
        
    }
    
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        
            ArtistsView(bank: ArtistsBank())
                
    }
}

