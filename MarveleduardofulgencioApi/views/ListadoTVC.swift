 //
//  ListadoTVC.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import UIKit

 class ListadoTVC: UITableViewController {
    
    var filteredResults: [StructItem] = [StructItem]()
    var initialResults: [StructItem] = [StructItem]()

    let tableRefreshControl = UIRefreshControl()
    var resultsController = UITableViewController()
    let searchController = UISearchController(searchResultsController: nil)

    var isLoaded: Bool = false
    
    var viewModel: ListadoVM? {
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    
    // MARK: - Circle life app
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UNService.shared.authorize()
        configureTableView()
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl!)
        }
        
        creatingSearhBarInHeaderView()

        isLoaded = true
        refreshDisplay();
    }
    
    
    // MARK: - Private methods
    
    private func refreshDisplay()
    {
        if let viewModel = viewModel , isLoaded {
            title = viewModel.title
        } else {
            title = ""
        }
    }
    
    /// Configure table view
    private func configureTableView() {
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: "CellPersonaje", bundle: nil), forCellReuseIdentifier: "cellpersonaje")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    
    /// Creating search bar
    private func creatingSearhBarInHeaderView() {
        tableView.tableHeaderView = self.searchController.searchBar
        searchController.searchBar.delegate = self
     }
    
    
    /// Fill Initial Result
    private func fillInitialResult() {
        initialResults.removeAll()
        for i in 0..<viewModel!.numberOfItems {
            initialResults.append(viewModel?.itemAtIndex(i) as! StructItem)
        }
        filteredResults = initialResults
    }
    
}
 
 // MARK: - SearchBar Delegate
 
 extension ListadoTVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.endEditing(true)
        filterValues(searchBar: searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredResults = initialResults
        reloadTableView()
    }
    
    
    func filterValues(searchBar: UISearchBar) {
        
        guard let searchQuery = searchController.searchBar.text else { return }
        tableRefreshControl.beginRefreshing()

        if searchQuery.isEmpty {
            tableRefreshControl.endRefreshing()
            filteredResults = initialResults
            reloadTableView()
            
            return
        }

        // Empty before result
        filteredResults.removeAll()

        for i in 0..<initialResults.count {
            if initialResults[i].nombre.lowercased().contains(searchQuery.lowercased()) {
                filteredResults.append(initialResults[i])
            }
        }

        reloadTableView()
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
 }
 
// MARK: - DataSource / Delegate TableView
 
extension ListadoTVC
{
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let viewModel = viewModel {
            if viewModel.numberOfItems > 0 && initialResults.count == 0 {
                fillInitialResult()
            }
            return filteredResults.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellpersonaje") as! CellPersonaje
         cell.item = filteredResults[(indexPath as NSIndexPath).row]
         cell.imagenHablar.imagenView.load(url: URL(string:  (cell.item as! StructItem).finalyImage)!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      viewModel?.useItemAtIndex((indexPath as NSIndexPath).row)
    }
    
    /// Animation cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -100, 0, -100)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.5, animations: { cell.layer.transform = CATransform3DIdentity })
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

 // MARK: - ListadoVMViewDelegate
 
extension ListadoTVC: ListadoVMViewDelegate
{
    func valoresDidChange(viewModel: ListadoVM)
    {
        reloadTableView()
    }
}

