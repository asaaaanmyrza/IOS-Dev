//
//  MoviesController.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 25.11.2025.
//

import UIKit

let movies: [Item] = [Item(title: "Рио", image: UIImage(named:"1.webp")!, description: "Карлус Салданья", category: .movie), Item(title: "Зеленая книга", image: UIImage(named:"2.jpg")!, description: "Питер Фаррелли", category: .movie), Item(title: "1 + 1", image: UIImage(named:"3.jpg")!, description: "Эрик Толедано", category: .movie), Item(title: "Человек-бензопила. История Резе", image: UIImage(named:"4.jpg")!, description: "Тацуки Фуджимото", category: .movie), Item(title: "Волейбол! Битва на мусорной площадке", image: UIImage(named:"5.webp")!, description: "Харуити Фурудате", category: .movie)]

class MoviesController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MoviesController: UITableViewDataSource {
    // Header
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favourite Movies"
    }
    
    // Body
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? TableViewCell else {
            fatalError()
        }
        
        let currentMovie = movies[indexPath.row]
        
        cell.configureCell(item: currentMovie)
        return cell
        
    }
}

extension MoviesController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let vc = segue.destination as! DetailViewController
            
            if let indexPath = sender as? IndexPath {
                let selectedItem = movies[indexPath.row]
                vc.item = selectedItem
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
}
