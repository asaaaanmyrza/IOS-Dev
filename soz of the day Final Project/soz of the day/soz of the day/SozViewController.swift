//
//  SozViewController.swift
//  soz of the day
//
//  Created by Асан Мырзахметов on 10.12.2025.
//

import UIKit

class SozViewController: UIViewController {

    @IBOutlet weak var sozTimer: UILabel!
    @IBOutlet weak var sozExample3: UILabel!
    @IBOutlet weak var sozExample2: UILabel!
    @IBOutlet weak var sozExample1: UILabel!
    @IBOutlet weak var sozDefinition: UITextView!
    @IBOutlet weak var sozLabel: UILabel!
    
    var sozService = SozService()
    
    var timer: Timer?
    var seconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sozService.delegate = self
        
        startTimer()
    }
    
    func startTimer() {
        sozService.fetchSoz()
        sozTimer.text = "Kelesi soz: \(seconds)"

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.seconds -= 1
            self.sozTimer.text = "Kelesi soz: \(self.seconds)"

            if self.seconds == 0 {
                self.seconds = 30
                self.sozService.fetchSoz()
            }
        }
    }

}

extension SozViewController: SozServiceDelegate {
    func onSozDidUpdate(soz: SozModel) {
        configure(soz: soz)
    }
    
    private func configure(soz: SozModel) {
        sozLabel.text = soz.word
        sozDefinition.text = soz.description
        sozExample1.text = soz.examples[0]
        sozExample2.text = soz.examples[1]
        sozExample3.text = soz.examples[2]
    }
}
