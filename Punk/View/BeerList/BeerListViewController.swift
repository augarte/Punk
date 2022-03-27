//
//  BeerList.swift
//  Punk
//
//  Created by Aimar Ugarte on 5/3/22.
//

import UIKit

class BeerListViewController: PunkViewController {
    
    @IBOutlet weak var beerTableView: UITableView!
    
    var beerViewModel = BeerListViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    static func create() -> BeerListViewController {
        let beerListVC = BeerListViewController(nibName: BeerListViewController.typeName, bundle: nil)
        return beerListVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerViewModel.delegate = self
        beerViewModel.fetchAllBeers()
        
        setupSeachBar()
        setupTable()
        setupObservers()
        setupFilterIcon()
    }
    
    func setupSeachBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.scrollEdgeAppearance?.backgroundColor = .red
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.leftView?.tintColor = .systemGray
        searchController.searchBar.placeholder = NSLocalizedString("search.beer.food", comment: "")
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
    
    func setupTable() {
        beerTableView.register(UINib.init(nibName: BeerTableViewCell.typeName, bundle: nil), forCellReuseIdentifier: BeerTableViewCell.typeName)
        
        beerTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        beerTableView.separatorStyle = .none
        
        beerTableView.dataSource = self
        beerTableView.delegate = self
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updatedFilters(notification:)), name: Notification.Name("updatedFilters"), object: nil)
    }
    
    func setupFilterIcon() {
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action:  #selector(filterClickHandler))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func filterClickHandler() {
        let filterVC = BeerFilterViewController.create()
        showModalView(viewController: filterVC)
    }
}

//MARK: - ViewModelDelegate
extension BeerListViewController: ViewModelDelegate {
    
    func refreshTable() {
        beerTableView.reloadData()
    }
}

//MARK: - Notifications
extension BeerListViewController {
    
    @objc func updatedFilters(notification: Notification) {
        guard let type = notification.userInfo?["type"] as? FilterType
             else { return }
        guard let value = notification.userInfo?["value"] as? Float
             else { return }
        
        beerViewModel.filter(filterType: type, value: value)
    }
}

//MARK: - TableView
extension BeerListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive || beerViewModel.filtersActive {
            return beerViewModel.filteredList.count
        }
        return beerViewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var beerItemViewModel: BeerListItemViewModel
        if searchController.isActive || beerViewModel.filtersActive {
            beerItemViewModel = beerViewModel.filteredList[indexPath.row]
        } else {
            beerItemViewModel = beerViewModel.list[indexPath.row]
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.typeName) as? BeerTableViewCell else {
            assertionFailure("Cannot dequeue reusable cell \(BeerTableViewCell.self) with reuseIdentifier: \(BeerTableViewCell.typeName)")
            return UITableViewCell()
        }
        cell.configureCell(beerItemViewModel: beerItemViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return !(searchController.isActive || beerViewModel.filtersActive)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var beerVM: BeerListItemViewModel
        if searchController.isActive || beerViewModel.filtersActive {
            beerVM = beerViewModel.filteredList[indexPath.row]
        } else {
            beerVM = beerViewModel.list[indexPath.row]
        }

        guard let beer = beerViewModel.data.first(where: {$0.id == beerVM.id}) else {
            return
        }
        
        navigateToViewController(viewController: BeerDetailViewController.create(with: BeerDetailViewModel.init(beer: beer)))
    }
}

//MARK: - SearchView
extension BeerListViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
       
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let search = searchController.searchBar.text, !search.isEmpty {
            beerViewModel.didSearch(query: search)
        } else {
            beerViewModel.filteredList = beerViewModel.list
            beerTableView.reloadData()
        }
    }
}
