//
//  SplashViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 9/3/22.
//

import Foundation
import UIKit

class SplashViewController: PunkViewController {
    
    static func create() -> SplashViewController {
        let splashVC = SplashViewController(nibName: SplashViewController.typeName, bundle: nil)
        return splashVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
