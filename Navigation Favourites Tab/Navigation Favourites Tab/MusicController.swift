//
//  MusicController.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 25.11.2025.
//

import UIKit

let songs: [Item] = [Item(title: "Can't Stop", image: UIImage(named:"6.jpeg")!, description: "Red Hot Chili Peppers", category: .music), Item(title: "Static Age", image: UIImage(named:"7.jpg")!, description: "Green Day", category: .music), Item(title: "Fell in Love With a Girl", image: UIImage(named:"8.jpg")!, description: "The White Stripes", category: .music), Item(title: "Daiynbyz ba?", image: UIImage(named:"9.jpg")!, description: "ALEM", category: .music), Item(title: "EVERYTHING", image: UIImage(named:"10.jpeg")!, description: "The Black Skirts", category: .music)]

class MusicController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MusicController: UITableViewDataSource {
    // Header
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favourite Music"
    }
    
    // Body
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as? TableViewCell else {
            fatalError()
        }
        
        let currentSong = songs[indexPath.row]
        
        cell.configureCell(item: currentSong)
        return cell
        
    }
}

extension MusicController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let vc = segue.destination as! DetailViewController
            
            if let indexPath = sender as? IndexPath {
                let selectedItem = songs[indexPath.row]
                vc.item = selectedItem
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
}
