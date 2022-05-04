//
//  PunkViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 8/3/22.
//

import UIKit

class PunkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PUNK"
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func navigateToViewController(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showModalView(viewController: UIViewController) {
        viewController.modalPresentationStyle = .automatic
        present(viewController, animated: true)
    }
    
}
