//
//  BeerFilterViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 21/3/22.
//

import UIKit

public enum FilterType: Int {
    case abv = 0
    case ibu = 1
}

class BeerFilterViewController: PunkViewController {
    
    @IBOutlet weak var filters: UILabel!
    
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var abvSlider: UISlider!
    
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var ibuSlider: UISlider!
    
    //TODO: Requiere de un viewModel para la logica de los filtros (cuantos, cuales, como...)
    
    static func create() -> BeerFilterViewController {
        let beerFilterVC = BeerFilterViewController(nibName: BeerFilterViewController.typeName, bundle: nil)
        return beerFilterVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
        applyStyle()
    }
    
    func setupSliders() {
        
        abvSlider.tag = FilterType.abv.rawValue
        ibuSlider.tag = FilterType.ibu.rawValue
        
        abvSlider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.touchUpInside);
        ibuSlider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.touchUpInside);
        
    }
    
    func applyStyle() {
        filters.font = UIFont(name:"Helvetica Bold", size: 20.0)
        ibuLabel.font = UIFont(name:"Helvetica", size: 16.0)
        abvLabel.font = UIFont(name:"Helvetica", size: 16.0)
        
        filters.textColor = UIColor.black
        ibuLabel.textColor = UIColor.black
        abvLabel.textColor = UIColor.black
        
        filters.text = NSLocalizedString("filters", comment: "")
        abvLabel.text = NSLocalizedString("beer.abv", comment: "")
        ibuLabel.text = NSLocalizedString("beer.ibu", comment: "")
    }
}

extension BeerFilterViewController {
    
    @objc func sliderValueChanged(sender: UISlider) {
        guard let type = FilterType(rawValue: sender.tag) else {
            return
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updatedFilters"), object: nil, userInfo: ["type": type, "value": sender.value])
    }
    
}
