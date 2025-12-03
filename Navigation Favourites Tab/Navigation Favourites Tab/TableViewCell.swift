//
//  TableViewCell.swift
//  Navigation Favourites Tab
//
//  Created by Асан Мырзахметов on 25.11.2025.
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
    let image: UIImage
    let description: String
    let category: Category
}


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCover: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell (item: Item) {
        itemName.text = item.title
        itemCover.image = item.image
    }

}
