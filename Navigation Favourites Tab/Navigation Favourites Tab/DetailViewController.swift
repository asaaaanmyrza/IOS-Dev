//
//  DetailViewController.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 02.12.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?

    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetail()
    }
    
    func configureDetail() {
        detailTitle.text = item!.title
        detailText.text = item!.description
        detailImage.image = item!.image
    }
}
