//
//  BeerFilterViewController.swift
//  Punk
//
//  Created by Aimar Ugarte on 21/3/22.
//

import UIKit

class BeerFilterViewController: PunkViewController {
    
    @IBOutlet weak var filters: UILabel!
    @IBOutlet weak var filtersTableview: UITableView!
    
    var filterListViewModel = FilterListViewModel()
    
    //TODO: Requiere de un viewModel para la logica de los filtros (cuantos, cuales, como...)
    
    static func create() -> BeerFilterViewController {
        let beerFilterVC = BeerFilterViewController(nibName: BeerFilterViewController.typeName, bundle: nil)
        return beerFilterVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        applyStyle()
    }
    
    func setupTable() {
        filtersTableview.register(UINib.init(nibName: FilterTableViewCell.typeName, bundle: nil), forCellReuseIdentifier: FilterTableViewCell.typeName)
        
        filtersTableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        filtersTableview.separatorStyle = .none
        filtersTableview.allowsSelection = false
        
        filtersTableview.dataSource = self
        filtersTableview.delegate = self
    }
    
    func applyStyle() {
        filters.text = NSLocalizedString("filters", comment: "")
        filters.font = UIFont(name:"Helvetica Bold", size: 20.0)
        filters.textColor = UIColor.black
    }
}

//MARK: - TableView
extension BeerFilterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterListViewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.typeName) as? FilterTableViewCell else {
            assertionFailure("Cannot dequeue reusable cell \(FilterTableViewCell.self) with reuseIdentifier: \(FilterTableViewCell.typeName)")
            return UITableViewCell()
        }
        
        guard filterListViewModel.list.count > indexPath.row  else {
            return UITableViewCell()
        }
        let filterViewModel = filterListViewModel.list[indexPath.row]
        cell.configureCell(filterViewModel:filterViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
}
