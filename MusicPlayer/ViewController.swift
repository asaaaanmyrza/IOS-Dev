//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Асан Мырзахметов on 09.11.2025.
//

import UIKit
import AVFoundation

struct Song {
    let title: String
    let author: String
    let image: UIImage
    let songName: String
}

var currentSongIndex = 0
var isPlaying = false

class ViewController: UIViewController {
    @IBOutlet weak var SongName: UILabel!
    @IBOutlet weak var SongImage: UIImageView!
    @IBOutlet weak var SongAuthor: UILabel!
    @IBOutlet weak var PlayButton: UIButton!
    
    func changeTrack(title: String, author: String, image: UIImage) {
        SongName.text = title
        SongAuthor.text = author
        SongImage.image = image
    }
    
    func changeSong (n: Int) {
        if currentSongIndex + n >= songs.count {
            currentSongIndex = -1
        }
        else if currentSongIndex + n < 0 {
            currentSongIndex = songs.count
        }
        currentSongIndex += n
        changeTrack(title: songs[currentSongIndex].title, author: songs[currentSongIndex].author, image: songs[currentSongIndex].image)
        if isPlaying {
            playSong(songToPlay: songs[currentSongIndex].songName)
        }
    }
    
    var songPlayer: AVAudioPlayer!
    
    func playSong(songToPlay: String) {
            if let url = Bundle.main.url(forResource: songToPlay, withExtension: "mp3") {
                do {
                    songPlayer = try! AVAudioPlayer(contentsOf: url)
                    songPlayer.play()
                }
            } else {
                print("Error: Sound not found")
            }
        }
    
    func loadSong(index: Int) {
            let song = songs[index]
            
            if let url = Bundle.main.url(forResource: song.songName, withExtension: "mp3") {
                do {
                    songPlayer = try AVAudioPlayer(contentsOf: url)
                    songPlayer?.prepareToPlay()
                } catch {
                    print("Error loading song: \(error.localizedDescription)")
                }
            }
        }
    
    let songs: [Song] = [Song(title: "Last Christmas", author: "Wham!", image: UIImage(named: "first.jpg")!, songName: "first"), Song(title: "All I Want For Christmas", author: "Mariah Carey", image: UIImage(named: "second.jpg")!, songName: "second"), Song(title: "Happy Xmas (The War is Over)", author: "John Lennon", image: UIImage(named: "third.jpg")!, songName: "third"), Song(title: "Merry Christmas, Happy Holidays", author: "*NSYNC", image: UIImage(named: "fourth.jpg")!, songName: "fourth"), Song(title: "Rockin' Around Christmas Tree", author: "Brenda Lee", image: UIImage(named: "fifth.jpg")!, songName: "fifth")]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSong(index: currentSongIndex)
    }
    
    @IBAction func Toggle(_ sender: UIButton) {
        if isPlaying {
            songPlayer.pause()
            isPlaying = false
            sender.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
        else {
            songPlayer.play()
            isPlaying = true
            sender.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
    }
    @IBAction func Prev(_ sender: UIButton) {
        changeSong(n: -1)
    }
    @IBAction func Next(_ sender: UIButton) {
        changeSong(n: 1)
    }
}


