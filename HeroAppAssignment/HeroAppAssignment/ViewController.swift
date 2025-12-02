//
//  ViewController.swift
//  HeroAppAssignment
//
//  Created by Асан Мырзахметов on 30.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroPlaceOfBirth: UILabel!
    @IBOutlet weak var heroIntelligence: UILabel!
    @IBOutlet weak var heroStrength: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroDurability: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroCombat: UILabel!
    @IBOutlet weak var heroIntelligenceProgress: UIProgressView!
    @IBOutlet weak var heroStrenghtProgress: UIProgressView!
    @IBOutlet weak var heroSpeedProgress: UIProgressView!
    @IBOutlet weak var heroDurabilityProgress: UIProgressView!
    @IBOutlet weak var heroPowerProgress: UIProgressView!
    @IBOutlet weak var heroCombatProgress: UIProgressView!
    
    var service = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        Task { @MainActor in
            guard let model = try? await service.fetchHero() else { return }
            
            heroName.text = model.name
            
            heroImage.kf.setImage(with: URL(string: model.images.md))
            
            heroFullName.text = "Full Name: \(model.biography.fullName)"
            heroPlaceOfBirth.text = "Place of Birth: \(model.biography.placeOfBirth)"
            
            heroIntelligence.text = "Intelligence: \(model.powerstats.intelligence)"
            heroIntelligenceProgress.setProgress(Float(model.powerstats.intelligence) / 100, animated: true)
            
            heroStrength.text = "Strength: \(model.powerstats.strength)"
            heroStrenghtProgress.setProgress(Float(model.powerstats.strength) / 100, animated: true)
            
            heroSpeed.text = "Strength: \(model.powerstats.speed)"
            heroSpeedProgress.setProgress(Float(model.powerstats.speed) / 100, animated: true)
            
            heroDurability.text = "Strength: \(model.powerstats.durability)"
            heroDurabilityProgress.setProgress(Float(model.powerstats.durability) / 100, animated: true)
            
            heroPower.text = "Strength: \(model.powerstats.power)"
            heroPowerProgress.setProgress(Float(model.powerstats.power) / 100, animated: true)
            
            heroCombat.text = "Strength: \(model.powerstats.combat)"
            heroCombatProgress.setProgress(Float(model.powerstats.combat) / 100, animated: true)
        }

    }
    
}


