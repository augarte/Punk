//
//  BeerTableViewCell.swift
//  Punk
//
//  Created by Aimar Ugarte on 6/3/22.
//

import UIKit
import Alamofire
import AlamofireImage

final class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var beerInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(beerItemViewModel: BeerListItemViewModel){
        beerName.text = beerItemViewModel.title
        beerTagline.text = beerItemViewModel.description
        beerInfo.text = beerItemViewModel.info
        
        beerImage.af.setImage(
            withURL: URL(string:beerItemViewModel.image)!,
            placeholderImage: UIImage(named: "Splash")
        )
        
        applyStyle()
    }
    
    func applyStyle() {
        selectionStyle = .none
        
        containerView.backgroundColor = UIColor.punkCellBackground
        containerView.layer.cornerRadius = 16
        
        beerName.textColor = UIColor.black
        beerTagline.textColor = UIColor.black
        beerInfo.textColor = UIColor.punkSecondaryText
    }

}
