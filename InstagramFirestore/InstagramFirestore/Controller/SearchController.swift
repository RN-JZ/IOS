import UIKit



private let reuseIdentifier = "cell"
class SearchController: UITableViewController {
    
    let searchController = UISearchController()
    
    var user = [User]()
    var filterData = [User]()
    var inSearchMode:Bool
    {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        SearchUser()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
       
    }
    
    
    func SearchUser()
    {
        UserService.fetchAllUser{user in
            print("DEBUG GET THE USER")
            self.user = user
            self.tableView.reloadData()
            
        }
       
    }


}

extension SearchController
{
    func style()
    {
        view.backgroundColor = .blue
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 64
    }
}

extension SearchController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ?filterData.count:user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        let user = inSearchMode ?UserCellViewModel(filterData[indexPath.row]):UserCellViewModel(user[indexPath.row])
        cell.viewModel = user
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let user = inSearchMode ? filterData[indexPath.row]:user[indexPath.row]
        var controller = ProfileViewController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension SearchController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        guard let data = searchController.searchBar.text else
        {
            return ;
        }
        print(data)
        
        filterData = user.filter { $0.fullName.lowercased().contains(data.lowercased()) || $0.userName.lowercased().contains(data.lowercased())}
        
        
        tableView.reloadData()

    }
    
    
}



