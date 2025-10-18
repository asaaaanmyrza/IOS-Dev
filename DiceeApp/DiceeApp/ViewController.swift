//
//  ViewController.swift
//  DiceeApp
//
//  Created by Асан Мырзахметов on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice1: UIImageView!
    
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "dice"), #imageLiteral(resourceName: "dice-2"), #imageLiteral(resourceName: "dice-3"), #imageLiteral(resourceName: "dice-4"), #imageLiteral(resourceName: "dice-5"), #imageLiteral(resourceName: "dice-6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dice1.image = diceImages[2]
        dice2.image = diceImages[4]
        
    }
    @IBAction func rollTheDices(_ sender: Any) {
        var rollCount = 0
        let totalRolls = 7
        let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.dice1.image = self.diceImages.randomElement()
            self.dice2.image = self.diceImages.randomElement()
            rollCount += 1
            
            if rollCount >= totalRolls {
                timer.invalidate()
            }
        }
    }
    

}

