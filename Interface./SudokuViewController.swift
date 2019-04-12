//
//  SudokuViewController.swift
//  Interface.
//
//  Created by etudiant on 08/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SudokuViewController: UIViewController {
   
    
    @IBOutlet weak var RetourButton: UIButton!
    @IBOutlet weak var FinishLabel: UILabel!
    var verif = Bool()
    var idc = 0
    //var cellView = UIButton()
    var arr = Array(repeating: Array(repeating : UIButton(), count:9), count: 9)
    var i = Int()
    var j = Int()
    var dimGrille = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //retourButton.isEnabled = true
        //retourButton.isHidden = true
        //FinishLabel.isHidden = true
        /*let numViewPerRow = 8
         let width = view.frame.width / CGFloat(numViewPerRow)
         
         var buttonArr = Array(repeating: Array(repeating : UIButton(), count:9), count: 9)
         
         cellView.frame = CGRect(x : 100 ,y : 100 ,width : 100 ,height : 100)
         cellView.setTitleColor(.black, for: .normal)
         cellView.backgroundColor = .green
         cellView.layer.borderWidth = 0.5
         cellView.layer.borderColor = UIColor.black.cgColor
         cellView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
         self.view.addSubview(cellView)*/
        
        /*for i in 0...8{
         for j in 0...8{
         buttonArr[j][i] = cellView
         buttonArr[j][i].frame = CGRect(x: CGFloat(i) * width ,y:CGFloat(j) * width , width: width, height: width)
         buttonArr[j][i].backgroundColor = .red
         self.view.addSubview(buttonArr[j][i])
         }
         }*/
        
        
        // Do any additional setup after loading the view, typically from a nib.
        /*var arr = Array(repeating: Array(repeating : UIView(), count:9), count: 9)
         let numd = UIView()
         let numViewPerRow = 8
         let width = view.frame.width / CGFloat(numViewPerRow)
         for i in 0...8{
         for j in 0...numViewPerRow{
         numd.backgroundColor = .red
         numd.frame = CGRect(x : CGFloat(j) * width, y: CGFloat(i) * width, width: width, height: width)
         arr[i][j] = numd
         arr[i][j].backgroundColor = .red
         arr[i][j].frame = CGRect(x : CGFloat(j) * width, y: CGFloat(i) * width, width: width, height: width)
         print(i,j)
         view.addSubview(numd)
         }
         }*/
        
        RetourButton.isHidden = true
        FinishLabel.isHidden = true
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
        random(n: 12)
        
        // cellView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target : self, action : #selector(handlePan)))
        
        
    }
    
    
    @objc func buttonAction(sender: UIButton!){
        //var value = [" ","1","2","3","4","5","6","7","8","9"] //?
        idc = (idc+1) % 10
        let button = sender as UIButton
        
        if button.currentTitle == ""{
            button.setTitle("1", for: .normal)
        }
        else{
            button.setTitle(String(((Int(button.currentTitle!)! + 1) % 10)), for: .normal)
            if button.currentTitle == "0"{
                button.setTitle("1", for: .normal)
            }
        }
        //  button.setTitle("\(buttonInt)", for: UIControlState.normal)
        
        for i in 0...dimGrille{
            for j in 0...dimGrille{
                if arr[j][i].currentTitle == ""{
                    verif = false
                }
            }
        }
        print(verif)
        if verif {
            if validation(){
                print("ok v")
                for i in 0...dimGrille{
                    for j in 0...dimGrille{
                        arr[j][i].isHidden = true
                        FinishLabel.isHidden = false
                        RetourButton.isHidden = false
        
                    }
                }
            }
        }
        verif = true
        
    }
    
    
    @objc func handlePan(gesture : UIPanGestureRecognizer) {
        let location = gesture.location(in : view)
        print(location)
    }
    
    //Vérification des occurences dans le tableau pour les lignes
    func lineVerification (x : Int, y : Int , cont : String) -> Bool
    {
        for i in 0...dimGrille{
            if i != x {
                if arr[i][y].currentTitle == cont{
                    //print("LineVer Faux")
                    return false
                }
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
                //  print(count)
            }
        }
    }
    
    @objc func nulaction(sender : UIButton){
        
    }
    //vérification des occurences dans le tableau pour les colonnes
    func colVerification (x:Int, y:Int, cont : String) -> Bool
    {
        for j in 0...dimGrille{
            if j != y{
                if arr[x][j].currentTitle == cont{
                    
                    return false
                }
            }
        }
        return true
    }
    
    func validation () -> Bool {
        for i in 0...dimGrille{
            for j in 0...dimGrille{
                print("j:",j, "i:",i)
                if !((lineVerification(x: j, y: i, cont: arr[j][i].currentTitle!)) && colVerification(x: j, y: i, cont: arr[j][i].currentTitle!)){
                    print("line verif: ",lineVerification(x: j, y: i, cont: arr[j][i].currentTitle!))
                    print("col verif: ",colVerification(x: j, y: i, cont: arr[j][i].currentTitle!))
                    print("arr [j",j,"][i",i,"] = ",arr[j][i].currentTitle)
                    return false
                }
            }
        }
        print("no occurence")
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

