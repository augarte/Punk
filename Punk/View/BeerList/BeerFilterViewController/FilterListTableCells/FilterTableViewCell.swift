//
//  FilterTableViewCell.swift
//  Punk
//
//  Created by Aimar Ugarte on 28/3/22.
//

import UIKit

final class FilterTableViewCell: UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var minimum: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var maximum: UILabel!
    @IBOutlet weak var current: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(filterViewModel: FilterListItemViewModel){
        title.text = filterViewModel.title
        
        slider.tag = filterViewModel.filterType.rawValue
        slider.minimumValue = filterViewModel.min ?? 0
        minimum.text = slider.minimumValue.clean
        slider.maximumValue = filterViewModel.max ?? 0
        maximum.text = slider.maximumValue.clean
        slider.value = filterViewModel.startingValue ?? 0
        current.text = slider.value.clean
        
        slider.addTarget(self, action: #selector(sliderValueUpdating), for: UIControl.Event.valueChanged);
        slider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.touchUpInside);
        
        applyStyle()
    }
    
    func applyStyle() {
        title.font = UIFont(name:"Helvetica", size: 16.0)
        current.font = UIFont(name:"Helvetica", size: 16.0)
        minimum.font = UIFont(name:"Helvetica", size: 16.0)
        maximum.font = UIFont(name:"Helvetica", size: 16.0)
        
        title.textColor = UIColor.black
        current.textColor = UIColor.black
        minimum.textColor = UIColor.black
        maximum.textColor = UIColor.black
    }
}

//MARK: - Slider
extension FilterTableViewCell {
    
    @objc func sliderValueUpdating(sender: UISlider) {
        current.text = Float(round(10 * sender.value) / 10).clean
    }
    
    @objc func sliderValueChanged(sender: UISlider) {
        guard let type = FilterType(rawValue: sender.tag) else {
            return
        }

        NotificationCenter.default.post(name: Notification.Name(rawValue: "updatedFilters"), object: nil, userInfo: ["type": type, "value": Float(round(10 * sender.value) / 10)])
    }
}
