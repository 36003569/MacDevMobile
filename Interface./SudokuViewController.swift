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
    var dimGrille = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numViewPerRow = dimGrille + 1
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        
        for j in 0...4{
            for i in 0...4{
                let cellView = UIButton(frame: CGRect (x: CGFloat(i) * width , y : CGFloat(j) * width , width : width , height : width))
                cellView.backgroundColor = .white
                cellView.setTitle("", for: .normal)
                cellView.setTitleColor(.black, for: .normal)
                /*cellView.frame = CGRect(x: CGFloat(i) * width , y : CGFloat(j) * width , width : width , height : width)*/
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                arr[i][j] = cellView
                view.addSubview(arr[i][j])
                arr[i][j].addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                
            }
        }
        random(n: 20)
        
        // cellView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target : self, action : #selector(handlePan)))
        
        
    }
    
    @objc func buttonAction(sender: UIButton!){
        var value = [" ","1","2","3","4","5","6","7","8","9"] //?
        idc = (idc+1) % 10
        let button = sender as UIButton
        
        if button.currentTitle == ""{
            button.setTitle("1", for: .normal)
        }
        else{
            button.setTitle(String((Int(button.currentTitle!)! + 1) % 10), for: .normal)
        }
        //  button.setTitle("\(buttonInt)", for: UIControlState.normal)
        
    }
    
    
    @objc func handlePan(gesture : UIPanGestureRecognizer) {
        let location = gesture.location(in : view)
        print(location)
    }
    
    //Vérification des occurences dans le tableau pour les lignes
    func lineVerification (x : Int, y : Int , cont : String) -> Bool
    {
        for i in 0...dimGrille{
            if arr[i][y].currentTitle == cont{
                //print("LineVer Faux")
                return false
            }
        }
        //print("line true")
        return true
    }
    
    func random(n : Int){
        var count = 0
        let numViewPerRow  = UInt32(dimGrille + 1)
        while count < n{
            let cellulex = Int(arc4random_uniform(numViewPerRow))
            let celluley = Int(arc4random_uniform(numViewPerRow))
            let number = String(arc4random_uniform(9) + 1)
            if lineVerification(x: cellulex, y: celluley, cont: number) && colVerification(x: cellulex, y: celluley, cont: number) && arr[cellulex][celluley].currentTitle == ""
            {
                arr[cellulex][celluley].setTitle(number, for: .normal)
                arr[cellulex][celluley].backgroundColor = .gray
                arr[cellulex][celluley].addTarget(self, action: #selector(nulaction), for: .touchUpInside)
                arr[cellulex][celluley].removeTarget(self, action: #selector(buttonAction), for: .allEvents)
                count = count + 1
                print(count)
            }
        }
    }
    
    @objc func nulaction(sender : UIButton){
        
    }
    //vérification des occurences dans le tableau pour les colonnes
    func colVerification (x:Int, y:Int, cont : String) -> Bool
    {
        for j in 0...dimGrille{
            if arr[x][j].currentTitle == cont{
                
                return false
            }
        }
        return true
    }
    
    func validation () -> Bool {
        for i in 0...dimGrille{
            for j in 0...dimGrille{
                if (!(lineVerification(x: j, y: i, cont: arr[j][i].currentTitle!)) && colVerification(x: j, y: i, cont: arr[j][i].currentTitle!)){
                    return false
                }
            }
        }
        return true
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
