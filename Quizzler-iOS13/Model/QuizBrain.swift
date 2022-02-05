//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Alicia Windsor on 05/02/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNum = 0
    var userScore = 0
    var answerNum = 0
    
    //check user ans is correct and update score
    mutating func checkAnswer (_ ans : String) -> Bool{

        if ans == quiz[questionNum].correctAnswer{
            userScore += 1
            return true
            
        }else{
            return false
        }
        
    }
    
    //give next question
    mutating func getNextQuestion () -> String {
        
        if questionNum < quiz.count - 1 {
            questionNum += 1
            answerNum += 1
           
        }else{
            questionNum = 0
            userScore = 0
            answerNum = 0
        }

        return quiz[questionNum].text
    }
    
    mutating func getAnswerChoices() -> [String] {
       // print(quiz[questionNum].answer)
        return quiz[answerNum].answer
    }
    
    //calc user progress
    func getProgress() -> Float{
        return Float(questionNum + 1)/Float(quiz.count) //+1 so that progress is accurate.
    }
    
    //return user score
   func getScore () -> Int{
        return userScore
    }
    
    //do on load
    
    mutating func viewOnLoad () {
        questionNum = -1
        answerNum = -1
    }
}
