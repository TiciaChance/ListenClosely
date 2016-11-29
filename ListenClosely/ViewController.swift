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
    @IBOutlet var soundButtons: [UIButton]!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

