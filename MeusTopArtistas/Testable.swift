//
//  Testable.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import SwiftUI

struct SwiftUIView: View{
    
    @State var didTap = false
    //colocar a variavel como State serve para ela poder ser
    //lida e escrita na view
    
    var body: some View{
        
        Button(action: {//quando aperta o botão
            print("Você apertou o botão")
            didTap = !didTap //trocar o valor de didTap
        }){
            //Aqui você monta a view do botão
            HStack{
                Text("Tudo isso é a view do botão")
                Image("isaac")
                    .resizable()
                    .frame(width: 100, height: 100)
            }.padding()
            .background(Color(didTap ? .lightGray : .black))
            //se didTap for TRUE o resultado é .lightGray
            //se didTap for FALSE o resultado é .black
            //se quiser, pode criar uma função ao inves disso
            
        }
            
    }
}

struct swiftUIPreview: PreviewProvider{
    static var previews: some View{
        SwiftUIView()
    }
}
