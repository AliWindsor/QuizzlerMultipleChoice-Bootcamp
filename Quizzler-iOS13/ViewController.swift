//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Q1", "True"],
        ["Q2", "False"],
        ["Q3", "True"],
    ]
    
    var questionNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func responseButton(_ sender: UIButton) {
        
        let userAns = sender.currentTitle!
        let correctAns = quiz[questionNum][1]
        
        if userAns == correctAns{
            print("Correct")
        }else{
            print("Wrong")
        }
  
        if questionNum < quiz.count - 1{
            questionNum += 1
        }else{
            questionNum = 0
        }
        
        updateUI()
    }
    
    func updateUI (){
        questionLabel.text = quiz[questionNum][0]
    }
    

}

