//
//  BooksController.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 25.11.2025.
//

import UIKit

let books: [Item] = [Item(title: "Человек, который смеётся", image: UIImage(named:"11.webp")!, description: "Виктор Гюго", category: .book), Item(title: "Так говорил Заратустра", image: UIImage(named:"12.jpg")!, description: "Фридрих Ницше", category: .book), Item(title: "Слова назидания", image: UIImage(named:"13.webp")!, description: "Абай", category: .book), Item(title: "Невероятные приключения ДжоДжо", image: UIImage(named:"14.jpg")!, description: "Хирохико Араки", category: .book), Item(title: "Человек-бензопила", image: UIImage(named:"15.webp")!, description: "Тацуки Фуджимото", category: .book)]

class BooksController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BooksController: UITableViewDataSource {
    // Header
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favourite Literature"
    }
    
    // Body
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? TableViewCell else {
            fatalError()
        }
        
        let currentBook = books[indexPath.row]
        
        cell.configureCell(item: currentBook)
        return cell
        
    }
}

extension BooksController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let vc = segue.destination as! DetailViewController
            
            if let indexPath = sender as? IndexPath {
                let selectedItem = books[indexPath.row]
                vc.item = selectedItem
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
}
