//
//  SudokuView.swift
//  Interface.
//
//  Created by etudiant on 08/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SudokuView: UIView {

    func drawButton(){
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
