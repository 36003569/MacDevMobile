//
//  JeuViewController.swift
//  Interface.
//
//  Created by etudiant on 04/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class JeuViewController: UIViewController {
    
    
    @IBOutlet weak var LabelTimer: UILabel!
    var gameTimer = Timer()
    var intTimer : Int = 0
    
    var pause : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(JeuViewController.startGameTimer), userInfo: nil, repeats: true)
        //finishLabel.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startGameTimer()
    {
        if pause==false{
            intTimer += 1
            LabelTimer.text = String(intTimer)
        }else{
        }
    }
    
    @IBAction func PauseButton(_ sender: Any) {
        if pause==false {
            pause = true
        }else{
            pause = false
        }
    }
}
