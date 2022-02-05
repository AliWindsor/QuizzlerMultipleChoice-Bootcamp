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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    @IBAction func responseButton(_ sender: UIButton) {
        
        let userAns = sender.currentTitle!
        
        //answer checking logic
        var userGotItRight = quizBrain.checkAnswer(userAns)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
       
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
        /* OR use a timer. Using GCD as above seems to be mroe favoured as its more optimized.
         
         Timer.scheduledTimer(time.Interval: 0.5. target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)
         
         add @obj c to updateUI func
         */
        
    }
    
    func updateUI (){
        
        //next question 
        questionLabel.text = quizBrain.getNextQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
    }
    

}

