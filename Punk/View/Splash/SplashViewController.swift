//
//  SplashViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 9/3/22.
//

import Foundation

class SplashViewController: PunkViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setViewControllers([BeerListViewController.create()], animated: true)
    }
}
