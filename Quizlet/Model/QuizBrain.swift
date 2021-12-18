//
//  QuizBrain.swift
//  Quizlet
//
//  Created by Mac on 13.12.2021.
//

import Foundation
struct QuizBrain {
    let quiz:[Question] = [
        Question(question:"Blood is red.", answer: "True"),
        Question(question:"5*5= 20", answer: "False"),
        Question(question:"the most important thing in life is money", answer: "False"),
        Question(question:"We gonna live forever", answer: "False"),
        Question(question:"Swift is a modern programmer language", answer: "True"),
        Question(question:"Everybody loves math", answer: "False"),
        Question(question:"Not everyone is same", answer: "True")
   ]
    var questionNumber=0
    var score=0
   mutating func checkAnswer(_ userAnswer:String)->Bool{
        if userAnswer==quiz[questionNumber].answer {
            //User got it right
            score += 1
            return true
        }else{
            //user got it wrong
            return false
        }
    }
    
    func getQuestionText()->String{
        return quiz[questionNumber].question
    }
    func getProgress()->Float{
        return Float(questionNumber+1)/Float(quiz.count)
    }
   mutating func nextQuestion(){
        if quiz.count > questionNumber + 1{
            questionNumber += 1
        }else{
            score=0
            questionNumber = 0
        }
    }
    func getScore()->Int{
       return score
    }
    
    
}
