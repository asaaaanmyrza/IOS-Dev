//
//  KokjiekViewController.swift
//  soz of the day
//
//  Created by Асан Мырзахметов on 10.12.2025.
//

import UIKit

class KokjiekViewController: UIViewController {

    @IBOutlet weak var KokjiekTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KokjiekTableView.dataSource = self
        KokjiekTableView.delegate = self
    }

}

extension KokjiekViewController: UITableViewDelegate {
    
}

extension KokjiekViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        KokjiekTableView.dequeueReusableCell(withIdentifier: "KokjiekCell", for: indexPath)
    }
    
    
}
