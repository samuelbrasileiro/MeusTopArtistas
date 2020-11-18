//
//  ViewController.swift
//  MeusTopArtistas
//
//  Created by Samuel Brasileiro on 28/09/20.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var artistsHost: UIHostingController<ArtistsView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let mjks = "lady+gaga"
//        SearchSong.fetchBy(artistName: mjks){result in
//            if case .success(let song) = result {
//                print(song.data![0].attributes!.artistName!)
//            }
//            else if case .failure(let error) = result{
//                print(error.localizedDescription)
//            }
//
//        }
        // Do any additional setup after loading the view.
        
        artistsHost = UIHostingController(rootView: ArtistsView(bank: ArtistsBank()))
        artistsHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(artistsHost!.view)
        
        let constraints = [
            artistsHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            artistsHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            artistsHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            artistsHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            artistsHost!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }


}

