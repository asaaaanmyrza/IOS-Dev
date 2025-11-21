//
//  MyTableViewCell.swift
//  MyFavorites TableView
//
//  Created by Асан Мырзахметов on 18.11.2025.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritesImage: UIImageView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var favoritesTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: Item) {
        favoritesTitle.text = item.title
        favoritesLabel.text = item.subtitle
        favoritesImage.image = item.image
    }

}
