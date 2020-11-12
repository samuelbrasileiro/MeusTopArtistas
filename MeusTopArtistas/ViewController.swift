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
        // Do any additional setup after loading the view.
        
//        artistsHost = UIHostingController(rootView: ArtistsView(bank: ArtistsBank()))
//        artistsHost?.view.translatesAutoresizingMaskIntoConstraints = true
//        artistsHost?.view.frame = CGRect(x: 10, y: 100, width: self.view.frame.width - 10, height: self.view.frame.height - 100 - 40)
//        self.view.backgroundColor = .orange
//        self.artistsHost?.view.backgroundColor = .clear
//        self.view.addSubview(artistsHost!.view)
    }


}

