//
//  SeacrhViewController.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 01.01.2023.
//

import UIKit

class SeacrhViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource, SearchResultNetworkManagerDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var resultMovies = [MovieTitle]()
    

    let searchController = UISearchController()
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        tableView.backgroundColor = UIColor(red: 23/255.0, green: 21/255.0, blue: 56/255.0, alpha: 1)
    
        
        searchController.searchResultsUpdater = self
        networkManager.searchResultDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    func didUpdateSearchResult(with searchResult: [MovieTitle]) {
        self.resultMovies = searchResult
        DispatchQueue.main.async {
            self.tableView.reloadData()
}
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        networkManager.search(with: text.trimmingCharacters(in: .whitespaces))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultMovieCell", for: indexPath) as! ResultTableViewCell
        cell.updateCell(movie: resultMovies[indexPath.row])
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        guard segue.identifier == "showMovieOverview" else{return}
//        let indexPath = tableView.indexPathForSelectedRow!
//        let movie = resultMovies[indexPath.row]
//        if let overviewVC = segue.destination as? MovieOverviewViewController{
//            overviewVC.movie = movie
//        }
//        let vc = storyboard?.instantiateViewController(withIdentifier: "SingleMovie") as? MovieOverviewViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
           let vc = storyboard?.instantiateViewController(withIdentifier: "SingleMovie") as? MovieOverviewViewController
        vc?.movie = resultMovies[indexPath.row]
                self.navigationController?.pushViewController(vc!, animated: true)
    }
    


}
