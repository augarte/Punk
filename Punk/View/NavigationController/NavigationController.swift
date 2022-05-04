//
//  NavigationController.swift
//  Punk
//
//  Created by Aimar Ugarte on 4/5/22.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([BeerListViewController.create()], animated: true)
    }

}
