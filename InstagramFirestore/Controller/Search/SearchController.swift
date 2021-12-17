//
//  SearchController.swift
//  InstagramFirestore
//
//  Created by Alex Mosunov on 15.11.2021.
//

import UIKit

private let reusId = "UserCell"

class SearchController: UITableViewController {
    
    // MARK: Properties
    
    private var users = [User]()
    private var filteredUsers = [User]()
    private let searchConttroller = UISearchController(searchResultsController: nil)
    
    private var inSearchMode: Bool {
        return searchConttroller.isActive && !(searchConttroller.searchBar.text?.isEmpty ?? true)
    }
    
    // MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        configureSearchController()
        configureTableView()
        fetchUsers()
    }
    
    // MARK: API
    
    func fetchUsers() {
        UserService.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    // MARK: Helpers
    
    func configureTableView() {
        view.backgroundColor = .white
        tableView.register(UserCell.self, forCellReuseIdentifier: reusId)
        tableView.rowHeight = 64
    }
    
    func configureSearchController() {
        searchConttroller.searchResultsUpdater = self
        searchConttroller.obscuresBackgroundDuringPresentation = false
        searchConttroller.hidesNavigationBarDuringPresentation = false
        searchConttroller.searchBar.placeholder = "Search"
        navigationItem.searchController = searchConttroller
        definesPresentationContext = false
    }
}

// MARK: UITABLEVIEWDATASOURCE

extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusId, for: indexPath) as! UserCell
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        cell.viewModel = UserCellViewModel(user: user)
        return cell
    }
}

// MARK: UiTableViewDelegate

extension SearchController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        let vc = ProfileController(user: user)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: UISearchResultsUpdating

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        filteredUsers = users.filter {
            $0.username.lowercased().contains(searchText) || $0.fullname.lowercased().contains(searchText)
        }
        self.tableView.reloadData()
    }
    
    
}
