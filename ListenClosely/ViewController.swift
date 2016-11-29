//
//  ViewController.swift
//  ListenClosely
//
//  Created by Laticia Chance on 11/29/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import AVFoundation

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet var soundButton: [UIButton]!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    var sound1Player:AVAudioPlayer!
    var sound2Player:AVAudioPlayer!
    var sound3Player:AVAudioPlayer!
    var sound4Player:AVAudioPlayer!
    
    var playlist = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles()
    }
    
    func setupAudioFiles (){
        
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
            
            
        }catch {
            print(error)
        }
        
        sound1Player.delegate = self
        sound2Player.delegate = self
        sound3Player.delegate = self
        sound4Player.delegate = self
        
        sound1Player.numberOfLoops = 0
        sound2Player.numberOfLoops = 0
        sound3Player.numberOfLoops = 0
        sound4Player.numberOfLoops = 0
        
        
        
    }
    
    
    @IBAction func soundButtonPressed(sender: AnyObject) {
        
        if readyForUser {
            let button = sender as! UIButton
            
            switch button.tag {
            case 1:
                sound1Player.play()
                checkIfCorrect(buttonPressed: 1)
                break
            case 2:
                sound2Player.play()
                checkIfCorrect(buttonPressed: 2)
                break
            case 3:
                sound3Player.play()
                checkIfCorrect(buttonPressed: 3)
                break
            case 4:
                sound4Player.play()
                checkIfCorrect(buttonPressed: 4)
                break
            default:
                break
            }
            
        }
        
        
        
        
    }
    
    
    func checkIfCorrect (buttonPressed:Int) {
        if buttonPressed == playlist[numberOfTaps] {
            if numberOfTaps == playlist.count - 1 { // we have arrived at the last item of the playlist
                
                
                
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.nextRound()
                    
                }
                return
            }
            
            numberOfTaps += 1
        }else{ // GAME OVER
            resetGame()
        }
    }
    
    
    func resetGame() {
        level = 1
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        playlist = []
        levelLabel.text = "GAME OVER"
        startGameButton.isHidden = false
        disableButtons()
    }
    
    func nextRound() {
        
        level += 1
        levelLabel.text = "Level \(level)"
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        disableButtons()
        
        
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        
        playNextItem()
        
        
        
    }
    
    @IBAction func startGame(sender: AnyObject) {
        levelLabel.text = "Level 1"
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        startGameButton.isHidden = true
        playNextItem()
        
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        
        if currentItem <= playlist.count - 1 {
            playNextItem()
        }else{
            readyForUser = true
            resetButtonHighlights()
            enableButtons()
        }
        
        
    }
    
    func playNextItem () {
        let selectedItem = playlist[currentItem]
        
        switch selectedItem {
        case 1:
            highlightButtonWithTag(tag: 1)
            sound1Player.play()
            break
        case 2:
            highlightButtonWithTag(tag: 2)
            sound2Player.play()
            break
        case 3:
            highlightButtonWithTag(tag: 3)
            sound3Player.play()
            break
        case 4:
            highlightButtonWithTag(tag: 4)
            sound4Player.play()
            break
        default:
            break;
        }
        
        currentItem += 1
        
    }
    
    func highlightButtonWithTag (tag:Int) {
        switch tag {
        case 1:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(#imageLiteral(resourceName: "redPressed"), for: .normal)
        case 2:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(#imageLiteral(resourceName: "yellowPressed"), for: .normal)
        case 3:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(#imageLiteral(resourceName: "bluePressed"), for: .normal)
        case 4:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(#imageLiteral(resourceName: "greenPressed"), for: .normal)
        default:
            break
        }
    }
    
    func resetButtonHighlights () {
        soundButton[0].setImage(#imageLiteral(resourceName: "red"), for: .normal)
        soundButton[1].setImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        soundButton[2].setImage(#imageLiteral(resourceName: "blue"), for: .normal)
        soundButton[3].setImage(#imageLiteral(resourceName: "green"), for: .normal)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//MARK: DISABLE OR ENABLE BUTTONS

extension ViewController {
    
    
    func disableButtons () {
        for button in soundButton {
            button.isUserInteractionEnabled = false
        }
    }
    
    func enableButtons () {
        for button in soundButton {
            button.isUserInteractionEnabled = true
        }
    }

}

