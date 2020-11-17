//
//  SearchBarView.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 16/11/20.
//

import SwiftUI

struct SearchBarView: View{
    @ObservedObject var bank: ArtistsBank
    
    var body: some View{
        // Search view
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $bank.searchText, onEditingChanged: { isEditing in
                    self.bank.isSearching = true
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)
                
                Button(action: {
                    self.bank.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(bank.searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            if bank.isSearching  {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                    self.bank.searchText = ""
                    self.bank.isSearching = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
    }
    
}

struct SearchBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchBarView(bank: ArtistsBank())
        
    }
}
