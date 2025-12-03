//
//  CoursesController.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 25.11.2025.
//

import UIKit

let courses: [Item] = [Item(title: "Calculus I", image: UIImage(named:"16.jpg")!, description: "Аскат Кудайбергенов", category: .course), Item(title: "Calculus II", image: UIImage(named:"17.jpeg")!, description: "Аскат Кудайбергенов", category: .course), Item(title: "Merging Personal and Global Evolution", image: UIImage(named:"18.png")!, description: "Лариса Ли", category: .course), Item(title: "Introduction to Business Management", image: UIImage(named:"19.jpg")!, description: "Бигадеванахалли Авинаш", category: .course), Item(title: "IOS Development", image: UIImage(named:"20.jpg")!, description: "Арман Мырзакануров", category: .course)]

class CoursesController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CoursesController: UITableViewDataSource {
    // Header
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favourite Courses"
    }
    
    // Body
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as? TableViewCell else {
            fatalError()
        }
        
        let currentCourse = courses[indexPath.row]
        
        cell.configureCell(item: currentCourse)
        return cell
        
    }
}

extension CoursesController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let vc = segue.destination as! DetailViewController
            
            if let indexPath = sender as? IndexPath {
                let selectedItem = courses[indexPath.row]
                vc.item = selectedItem
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
}
