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
        let mjks = "900032829"
        
        
        Song.fetch(songID: mjks){result in
            if case .success(let song) = result {
                print(song.data![0].attributes!.artistName!)
            }
            else if case .failure(let error) = result{
                print(error.localizedDescription)
            }
            
        }
        // Do any additional setup after loading the view.
        
//        artistsHost = UIHostingController(rootView: ArtistsView(bank: ArtistsBank()))
//        artistsHost?.view.translatesAutoresizingMaskIntoConstraints = true
//        artistsHost?.view.frame = CGRect(x: 10, y: 100, width: self.view.frame.width - 10, height: self.view.frame.height - 100 - 40)
//        self.view.backgroundColor = .orange
//        self.artistsHost?.view.backgroundColor = .clear
//        self.view.addSubview(artistsHost!.view)
    }


}

