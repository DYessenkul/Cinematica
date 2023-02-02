//
//  FavouritesViewController.swift
//  Cinematica
//
//  Created by Дархан Есенкул on 02.01.2023.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //    var favouriteMovies = [MovieTitle(original_title: "Avatar", poster_path: "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg", release_date: "2009-12-15", vote_average: 7.6, overview: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.", vote_count: 27323)]
    
    var favourites = [MovieTitle(original_title: "Avatar", poster_path: "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg", release_date: "2009-12-15", vote_average: 7.6, overview: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.", vote_count: 27323)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 16/255.0, green: 14/255.0, blue: 42/255.0, alpha: 1)
        tableView.backgroundColor = UIColor(red: 23/255.0, green: 21/255.0, blue: 56/255.0, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveMovie" else {return}
        let sourceVC = segue.source as! MovieOverviewViewController
        let movie = sourceVC.movieToSave
        
        let newIndexPath = IndexPath(row: favourites.count, section: 0)
        favourites.append(movie)
        tableView.insertRows(at: [newIndexPath], with: .fade)
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteMovieCell", for: indexPath) as! FavouritesTableViewCell
        //        guard let model = favouriteMovies[indexPath.row] else {return UITableViewCell()}
        cell.updateCell(movie: favourites[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
