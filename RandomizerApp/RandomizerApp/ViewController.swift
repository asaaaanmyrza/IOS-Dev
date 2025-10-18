//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Асан Мырзахметов on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ItemImage: UIImageView!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var ItemTitle: UILabel!
    
    
    let randomItems: [String] = ["billie joe", "Wildberries bag", "sticky notes", "eki myn tenge", "jent", "periodic table", "screw", "sponges", "lace", "seat belt"]
    let randomImages: [UIImage] = [#imageLiteral(resourceName: "billie_joe"), #imageLiteral(resourceName: "wildberries"), #imageLiteral(resourceName: "sticky_note"), #imageLiteral(resourceName: "money"), #imageLiteral(resourceName: "jent"), #imageLiteral(resourceName: "periodic_table"), #imageLiteral(resourceName: "screw"), #imageLiteral(resourceName: "sponge"), #imageLiteral(resourceName: "lace"), #imageLiteral(resourceName: "seat_belt")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Randomize(_ sender: Any) {
        let randomIndex = Int.random(in: 0...9)
        ItemTitle.text = String(randomItems[randomIndex])
        ItemImage.image = randomImages[randomIndex]
    }
    
    


}

