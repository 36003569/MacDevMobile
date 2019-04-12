//
//  ViewController.swift
//  Interface.
//
//  Created by etudiant on 04/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var JouerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        JouerButton.backgroundColor = .green
        JouerButton.setTitleColor(.blue , for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

