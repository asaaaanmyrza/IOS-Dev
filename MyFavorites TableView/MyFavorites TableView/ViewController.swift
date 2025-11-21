//
//  ViewController.swift
//  MyFavorites TableView
//
//  Created by Асан Мырзахметов on 11.11.2025.
//

import UIKit

enum Category: String, CaseIterable {
    case movie = "Favourite Movies"
    case music = "Favourite Music"
    case book = "Favourite Books"
    case course = "Favourite Courses"
}

struct Item {
    let title: String
    let subtitle: String
    let image: UIImage
    let category: Category
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items: [Item] = [
        //movies
        Item(title: "Рио", subtitle: "Карлус Салданья", image: UIImage(named:"1.webp")!, category: .movie),
        Item(title: "Зеленая книга", subtitle: "Питер Фаррелли", image: UIImage(named:"2.jpg")!, category: .movie),
        Item(title: "1 + 1", subtitle: "Эрик Толедано", image: UIImage(named:"3.jpg")!, category: .movie),
        Item(title: "Человек-бензопила. История Резе", subtitle: "Тацуки Фуджимото", image: UIImage(named:"4.jpg")!, category: .movie),
        Item(title: "Волейбол! Битва на мусорной площадке", subtitle: "Харуити Фурудате", image: UIImage(named:"5.webp")!, category: .movie),
        //songs
        Item(title: "Can't Stop", subtitle: "Red Hot Chili Peppers", image: UIImage(named:"6.jpeg")!, category: .music),
        Item(title: "Static Age", subtitle: "Green Day", image: UIImage(named:"7.jpg")!, category: .music),
        Item(title: "Fell in Love With a Girl", subtitle: "The White Stripes", image: UIImage(named:"8.jpg")!, category: .music),
        Item(title: "Daiynbyz ba?", subtitle: "ALEM", image: UIImage(named:"9.jpg")!, category: .music),
        Item(title: "EVERYTHING", subtitle: "The Black Skirts", image: UIImage(named:"10.jpeg")!, category: .music),
        //books
        Item(title: "Человек, который смеётся", subtitle: "Виктор Гюго", image: UIImage(named:"11.webp")!, category: .book),
        Item(title: "Так говорил Заратустра", subtitle: "Фридрих Ницше", image: UIImage(named:"12.jpg")!, category: .book),
        Item(title: "Слова назидания", subtitle: "Абай", image: UIImage(named:"13.webp")!, category: .book),
        Item(title: "Невероятные приключения ДжоДжо", subtitle: "Хирохико Араки", image: UIImage(named:"14.jpg")!, category: .book),
        Item(title: "Человек-бензопила", subtitle: "Тацуки Фуджимото", image: UIImage(named:"15.webp")!, category: .book),
        //courses
        Item(title: "Calculus I", subtitle: "Аскат Кудайбергенов", image: UIImage(named:"16.jpg")!, category: .course),
        Item(title: "Calculus II", subtitle: "Аскат Кудайбергенов", image: UIImage(named:"17.jpeg")!, category: .course),
        Item(title: "Merging Personal and Global Evolution", subtitle: "Лариса Ли", image: UIImage(named:"18.png")!, category: .course),
        Item(title: "Introduction to Business Management", subtitle: "Бигадеванахалли Авинаш", image: UIImage(named:"19.jpg")!, category: .course),
        Item(title: "IOS Development", subtitle: "Арман Мырзакануров", image: UIImage(named:"20.jpg")!, category: .course)
    ]
    
    lazy var itemsByCategory: [Category: [Item]] = {
        Dictionary(grouping: items, by: { $0.category })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    //Header
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Category.allCases[section].rawValue
    }
    
    // Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = Category.allCases[section]
        return itemsByCategory[category]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as? MyTableViewCell else {
            fatalError()
        }

        let category = Category.allCases[indexPath.section]
        let currentItem = itemsByCategory[category]![indexPath.row]

        cell.configure(item: currentItem)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}



