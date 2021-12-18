//
//  ViewController.swift
//  Quizlet
//
//  Created by Mac on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var QuestionText: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let resultAnswer=quizBrain.checkAnswer(userAnswer)
        
        if resultAnswer{
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(updateUI),userInfo:nil, repeats: false)
        
    }
    
   @objc func updateUI(){
    QuestionText.text=quizBrain.getQuestionText()
    progressBar.progress=quizBrain.getProgress()
    scoreLabel.text="score: \(quizBrain.getScore())"
        btnTrue.backgroundColor=UIColor.clear
        btnFalse.backgroundColor=UIColor.clear
    
    }
}

