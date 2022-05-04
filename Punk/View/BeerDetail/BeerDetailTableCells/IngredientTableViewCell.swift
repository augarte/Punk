//
//  IngredientTableViewCell.swift
//  Punk
//
//  Created by Aimar Ugarte on 13/3/22.
//

import UIKit
import Alamofire
import AlamofireImage

final class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var ingredientTitle: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(ingredietnViewModel: IngredientsViewModel){
        ingredientTitle.text = ingredietnViewModel.ingredientTitle
        ingredientsLabel.text = ingredietnViewModel.ingredientsText
        
        applyStyle()
    }
    
    func applyStyle() {
        selectionStyle = .none
        
        ingredientView.backgroundColor = UIColor.punkCellBackground
        ingredientView.layer.cornerRadius = 16
        
        ingredientTitle.font = UIFont(name:"Helvetica Bold", size: 20.0)
        ingredientsLabel.font = UIFont(name:"Helvetica", size: 16.0)
        
        ingredientTitle.textColor = UIColor.black
        ingredientsLabel.textColor = UIColor.black
    }
}
