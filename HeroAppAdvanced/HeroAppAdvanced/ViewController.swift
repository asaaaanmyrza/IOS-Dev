//
//  ViewController.swift
//  HeroAppAdvanced
//
//  Created by Асан Мырзахметов on 03.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    //Hero Image
    @IBOutlet private weak var heroImage: UIImageView!
    //Hero Characteristics
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroFullName: UILabel!
    @IBOutlet private weak var heroRace: UILabel!
    //Intelligence
    @IBOutlet private weak var heroIntelligence: UILabel!
    @IBOutlet private weak var heroIntelligenceProgress: UIProgressView!
    //Strength
    @IBOutlet private weak var heroStrength: UILabel!
    @IBOutlet private weak var heroStrengthProgress: UIProgressView!
    //Speed
    @IBOutlet private weak var heroSpeed: UILabel!
    @IBOutlet private weak var heroSpeedProgress: UIProgressView!
    //Durability
    @IBOutlet private weak var heroDurability: UILabel!
    @IBOutlet private weak var heroDurabilityProgress: UIProgressView!
    //Power
    @IBOutlet private weak var heroPower: UILabel!
    @IBOutlet private weak var heroPowerProgress: UIProgressView!
    //Combat
    @IBOutlet private weak var heroCombat: UILabel!
    @IBOutlet private weak var heroCombatProgress: UIProgressView!
    
    
    var heroService = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        heroService.delegate = self
    }
    
    @IBAction private func buttonDidTap() {
        heroService.fetchHero()
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(hero: HeroModel) {
        configure(hero: hero)
    }
    
    private func configure(hero: HeroModel) {
        heroImage.kf.setImage(with: URL(string: hero.images.md))
        
        heroName.text = hero.name
        heroFullName.text = hero.biography.fullName
        heroRace.text = hero.appearance.race
        
        let intelligence = hero.powerstats.intelligence
        heroIntelligence.text = "Intelligence: (\(intelligence))"
        heroIntelligenceProgress.setProgress(Float(intelligence) / 100, animated: true)
        
        let strength = hero.powerstats.strength
        heroStrength.text = "Strength: (\(strength))"
        heroStrengthProgress.setProgress(Float(strength) / 100, animated: true)
        
        let speed = hero.powerstats.speed
        heroSpeed.text = "Speed: (\(speed))"
        heroSpeedProgress.setProgress(Float(speed) / 100, animated: true)
        
        let durability = hero.powerstats.durability
        heroDurability.text = "Durability: (\(durability))"
        heroDurabilityProgress.setProgress(Float(durability) / 100, animated: true)
        
        let power = hero.powerstats.power
        heroPower.text = "Power: (\(power))"
        heroPowerProgress.setProgress(Float(power) / 100, animated: true)
        
        let combat = hero.powerstats.combat
        heroCombat.text = "Combat: (\(combat))"
        heroCombatProgress.setProgress(Float(combat) / 100, animated: true)
    }
}

