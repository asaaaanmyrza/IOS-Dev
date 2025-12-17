//
//  KokjiekViewCell.swift
//  soz of the day
//
//  Created by Асан Мырзахметов on 14.12.2025.
//

import UIKit
import Kingfisher

class KokjiekViewCell: UITableViewCell {

    @IBOutlet weak var kokjiekDescription: UITextView!
    @IBOutlet weak var kokjiekTitle: UILabel!
    @IBOutlet weak var kokjiekImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with video: FeedModel) {
        kokjiekTitle.text = video.title
        kokjiekDescription.text = video.description
        kokjiekImage.kf.setImage(with: URL(string: video.thumbnail))
    }
}
