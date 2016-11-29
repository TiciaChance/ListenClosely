//
//  Music.swift
//  ListenClosely
//
//  Created by Laticia Chance on 11/29/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import Foundation
import AVFoundation



class Music: NSObject, AVAudioPlayerDelegate {
    
    var sound1Player: AVAudioPlayer?
    var sound2Player: AVAudioPlayer?
    var sound3Player: AVAudioPlayer?
    var sound4Player: AVAudioPlayer?
    
    
    
    
    var playlist = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var level = 1
    
    func setUpAudioFiles() {
        let soundFIlePath = Bundle.main.path(forResource: "1", ofType: "wav")
        let soundFileURL = URL(fileURLWithPath: soundFIlePath!)
        
        
        let soundFIlePath2 = Bundle.main.path(forResource: "2", ofType: "wav")
        let soundFileURL2 = URL(fileURLWithPath: soundFIlePath2!)
        
        let soundFIlePath3 = Bundle.main.path(forResource: "3", ofType: "wav")
        let soundFileURL3 = URL(fileURLWithPath: soundFIlePath3!)
        
        let soundFIlePath4 = Bundle.main.path(forResource: "4", ofType: "wav")
        let soundFileURL4 = URL(fileURLWithPath: soundFIlePath4!)
        
        do {
            try sound1Player = AVAudioPlayer(contentsOf: soundFileURL)
            try sound2Player = AVAudioPlayer(contentsOf: soundFileURL2)
            try sound3Player = AVAudioPlayer(contentsOf: soundFileURL3)
            try sound4Player = AVAudioPlayer(contentsOf: soundFileURL4)
            
        } catch{
            print(error)
        }
        
        sound1Player?.delegate = self
        sound2Player?.delegate = self
        sound3Player?.delegate = self
        sound4Player?.delegate = self
        
        sound1Player?.numberOfLoops = 0
        sound2Player?.numberOfLoops = 0
        sound3Player?.numberOfLoops = 0
        sound4Player?.numberOfLoops = 0
        
    }

}
