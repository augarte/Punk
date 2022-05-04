//
//  BeerDetailViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 13/3/22.
//

import UIKit

class BeerDetailViewController: PunkViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var beerTitle: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerVolume: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var ingredientTVHeightConstrain: NSLayoutConstraint!
    
    private var beerDetailVM: BeerDetailViewModel!
    
    static func create(with beerDetailVM: BeerDetailViewModel) -> BeerDetailViewController {
        let beerDetailVC = BeerDetailViewController(nibName: BeerDetailViewController.typeName, bundle: nil)
        beerDetailVC.beerDetailVM = beerDetailVM
        return beerDetailVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = beerDetailVM.title
        
        setupTableview()
        setupView()
    }
    
    private func setupTableview() {
        ingredientTableView.register(UINib.init(nibName: IngredientTableViewCell.typeName, bundle: nil), forCellReuseIdentifier: IngredientTableViewCell.typeName)
        
        ingredientTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        ingredientTableView.separatorStyle = .none
        
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
    }
    
    private func setupView(){
        beerTitle.font = UIFont(name:"Helvetica Bold", size: 25.0)
        beerVolume.font = UIFont(name:"Helvetica Bold", size: 25.0)
        beerTagline.font = UIFont(name:"Helvetica Light", size: 23.0)
        beerDescription.font = UIFont(name:"Helvetica", size: 16.0)
        
        beerTitle.text = beerDetailVM.title
        beerVolume.text = beerDetailVM.abv
        beerTagline.text = beerDetailVM.tagline
        beerDescription.text = beerDetailVM.description
        
        beerImage.af.setImage(
            withURL: URL(string:beerDetailVM.image)!,
            placeholderImage: UIImage(named: "Splash")
        )
        
        applyStyle()
    }
    
    private func applyStyle(){
        headerView.backgroundColor = UIColor.punkCellBackground
        headerView.layer.cornerRadius = 16
        
        beerTitle.textColor = UIColor.black
        beerVolume.textColor = UIColor.black
        beerTagline.textColor = UIColor.black
        beerDescription.textColor = UIColor.black
    }
}

extension BeerDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.typeName) as? IngredientTableViewCell else {
            assertionFailure("Cannot dequeue reusable cell \(IngredientTableViewCell.self) with reuseIdentifier: \(IngredientTableViewCell.typeName)")
            return UITableViewCell()
        }
    
        let ingredientType = IngredientType(rawValue: indexPath.row) ?? IngredientType.yeast
        let ingredientsViewModel = IngredientsViewModel.init(beerInfo: (beerDetailVM, ingredientType))
        cell.configureCell(ingredietnViewModel: ingredientsViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ingredientTVHeightConstrain.constant = tableView.contentSize.height
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
