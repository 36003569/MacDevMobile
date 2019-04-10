//
//  SudokuViewController.swift
//  Interface.
//
//  Created by etudiant on 08/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SudokuViewController: UIViewController {

    var idc = 0
    //var cellView = UIButton()
    var arr = Array(repeating: Array(repeating : UIButton(), count:9), count: 9)
    var i = Int()
    var j = Int()
    
    override func viewDidLoad() {
        
       /* let numViewPerRow = 8
        let numViewPerColumn = 8
        let width = view.frame.width / CGFloat(numViewPerRow)
        var cell : [[UIView]] = []
        let redview = UIView()
        
        for i in 0...numViewPerRow{
            cell.append( [] )
            for j in 0...numViewPerColumn{
                redview.backgroundColor = .red
                redview.frame = CGRect(x : CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cell[i].append(redview)
                print()
            }
        }*/
        let numViewPerRow = 9
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        
        for j in 0...8{
            for i in 0...8{
                let cellView = UIButton(frame: CGRect (x: CGFloat(i) * width , y : CGFloat(j) * width , width : width , height : width))
                cellView.backgroundColor = .white
                cellView.setTitle("\(i), \(j)", for: .normal)
                cellView.setTitleColor(.black, for: .normal)
                /*cellView.frame = CGRect(x: CGFloat(i) * width , y : CGFloat(j) * width , width : width , height : width)*/
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                arr[i][j] = cellView
                view.addSubview(arr[i][j])
                arr[i][j].addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                
            }
        }
    }
    @objc func buttonAction(sender: UIButton!){
        var value = [" ","1","2","3","4","5","6","7","8","9"] //?
        idc = (idc+1) % 10
        let button = sender as UIButton
        button.setTitle(value[idc], for: .normal)
        
        }
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
