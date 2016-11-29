//
//  ViewController.swift
//  ListenClosely
//
//  Created by Laticia Chance on 11/29/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var startPlayButton: UIButton!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet var soundButtons: [UIButton]!
    
    
    var music = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        music.setUpAudioFiles()
    }
    
  
    @IBAction func redButtonTapped(_ sender: Any) {
        highlight(button: 1)
        music.sound1Player?.play()
    }
  
    @IBAction func orangeButtonTapped(_ sender: Any) {
        highlight(button: 2)
        music.sound2Player?.play()

    }
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        highlight(button: 3)
        music.sound3Player?.play()

    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        highlight(button: 4)
        music.sound4Player?.play()

    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if  music.currentItem <= music.playlist.count - 1 {
            //play next item
        } else {
            music.readyForUser = true
            //reset button highlights
            //enable buttons
        }
    }
    
    func playNextIte() {
        let selectedItem = music.playlist[music.currentItem]
        switch selectedItem {
        case 1:
            music.sound1Player?.play()
        case 2:
            music.sound2Player?.play()
        case 3:
            music.sound2Player?.play()
        case 4:
            music.sound2Player?.play()
        default:
            break;
        }
    }
    
    func highlight(button withTag: Int) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

