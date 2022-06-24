//
//  QuestionsViewController.swift
//  PlayQuestionsApp
//
//  Created by Chawan Saeed on 6/12/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    var questions: [Questions] = [
        
        Questions(questionList: "Which English city is known as the Steel City?",rightAnswer: "Sheffield",wrongAnswerOne: "Birmingham",wrongAnswerTwo: "Sheffield",wrongAnswerThree: "Bristol",wrongAnswerFour: "Chester"),
        
        Questions(questionList: "Which element is said to keep bones strong?",rightAnswer: "Calcium",wrongAnswerOne: "Potassium",wrongAnswerTwo: "Iron",wrongAnswerThree: "Magnesium",wrongAnswerFour: "Calcium"),
        
        Questions(questionList: "How many rings is the Olympic symbol made up of?",rightAnswer: "Five",wrongAnswerOne: "Seven",wrongAnswerTwo: "Five",wrongAnswerThree: "Four",wrongAnswerFour: "Ten"),

        Questions(questionList: "Haematology is the study of what?",rightAnswer: "The blood",wrongAnswerOne: "The blood",wrongAnswerTwo: "The animals",wrongAnswerThree: "The religions",wrongAnswerFour: "The planets"),
 
        Questions(questionList: "Which religion is based on the spiritual teaching of Guru Nanak?",rightAnswer: "Sikhism",wrongAnswerOne: "Budism",wrongAnswerTwo: "Judaism",wrongAnswerThree: "Sikhism",wrongAnswerFour: "Taoism"),

        Questions(questionList: "What is the largest freshwater lake in the world by its area size?",rightAnswer: "Lake Superior",wrongAnswerOne: "Lake Tana",wrongAnswerTwo: "Lake of Fetzara",wrongAnswerThree: "Lake Débo",wrongAnswerFour: "Lake Superior"),

        Questions(questionList: "Which is the only planet in our solar system not named after a Roman or Greek god?",rightAnswer: "Earth",wrongAnswerOne: "Mars",wrongAnswerTwo: "Jupiter",wrongAnswerThree: "Earth",wrongAnswerFour: "Uranus"),

        Questions(questionList: "Pyrophobia is the fear of what?",rightAnswer: "Fire",wrongAnswerOne: "",wrongAnswerTwo: "Injury",wrongAnswerThree: "Holes",wrongAnswerFour: "Fire"),

        Questions(questionList: "What is the capital of Argentina?",rightAnswer: "Buenos Aires",wrongAnswerOne: "Buenos Aires",wrongAnswerTwo: "Formosa",wrongAnswerThree: "Santiago del Estero",wrongAnswerFour: "Chubut"),

        Questions(questionList: "Suriname is located on which continent?",rightAnswer: "South America",wrongAnswerOne: "Africa",wrongAnswerTwo: "Europe",wrongAnswerThree: "South America",wrongAnswerFour: "North Asia")
    ]
    //This is a list of outlets that will be used in this Project
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet var fourthOptionButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var index: Int = 0
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = 0
        score = 0

//        // Setting the background color into two mixed colors programatically
//        let gradient = CAGradientLayer()
//        
//        gradient.frame = view.bounds
//        gradient.colors = [
//            UIColor(red: 255.0/255.0, green: 173.0/255.0, blue: 173.0/255.0, alpha: 1).CGColor,
//            UIColor(red: 255.0/255.0, green: 232.0/255.0, blue: 214.0/255.0, alpha: 1).CGColor
//            ]
//        view.layer.insertSublayer(gradient, atIndex: 0)
        
        questionLabel.text = "\(questions[index].questionList)"
        firstOptionButton.setTitle("\(questions[index].wrongAnswerOne)", forState: .Normal)
        secondOptionButton.setTitle("\(questions[index].wrongAnswerTwo)", forState: .Normal)
        thirdOptionButton.setTitle("\(questions[index].wrongAnswerThree)", forState: .Normal)
        fourthOptionButton.setTitle("\(questions[index].wrongAnswerFour)", forState: .Normal)
        scoreLabel.text = "Score: \(score)"
        
        // Make the corners more curved
        firstOptionButton.clipsToBounds = true
        firstOptionButton.layer.cornerRadius = 22.0
        secondOptionButton.clipsToBounds = true
        secondOptionButton.layer.cornerRadius = 22.0
        thirdOptionButton.clipsToBounds = true
        thirdOptionButton.layer.cornerRadius = 22.0
        fourthOptionButton.clipsToBounds = true
        fourthOptionButton.layer.cornerRadius = 22.0
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = 30.0
    }
    
    @IBAction func AnswerButton(sender: UIButton) {
        
        if sender.titleLabel?.text == "\(questions[index].rightAnswer)" {
            score += 1
            scoreLabel.text = "Score: \(score)"
        } else if score != 0 {
            score -= 1
            scoreLabel.text = "Score: \(score)"
        }
        if sender.titleLabel?.text == "\(questions[index].rightAnswer)" {
            print("Answer was right")
            
            let alertController = UIAlertController(title: "Correct Answer", message: "Your answer was correct! good job and try the next question as well.", preferredStyle: .Alert)
            let cancelAlert = UIAlertAction(title: "Got it ", style: .Cancel, handler: nil)
            alertController.addAction(cancelAlert)
            presentViewController(alertController, animated: true, completion: nil)
            
            // After every question we add a one to the index variable so it will go to the other question afterwards, and when it reaches 10, we will load the view again so it will go to the first question again
            index += 1
            if index == 10 {
                viewDidLoad()
            }
            
            questionLabel.text = "\(questions[index].questionList)"
            firstOptionButton.setTitle("\(questions[index].wrongAnswerOne)", forState: .Normal)
            secondOptionButton.setTitle("\(questions[index].wrongAnswerTwo)", forState: .Normal)
            thirdOptionButton.setTitle("\(questions[index].wrongAnswerThree)", forState: .Normal)
            fourthOptionButton.setTitle("\(questions[index].wrongAnswerFour)", forState: .Normal)
            
        } else {
            print("Answer was wrong")
            
            let alertController = UIAlertController(title: "Incorrect Answer", message: "Yout answer was incorrect try your best in the next question!", preferredStyle: .Alert)
            let cancelAlert = UIAlertAction(title: "Got it", style: .Cancel, handler: nil)
            alertController.addAction(cancelAlert)
            presentViewController(alertController, animated: true, completion: nil)
            
            index += 1
            if index == 10 {
                viewDidLoad()
            }
            
            questionLabel.text = "\(questions[index].questionList)"
            firstOptionButton.setTitle("\(questions[index].wrongAnswerOne)", forState: .Normal)
            secondOptionButton.setTitle("\(questions[index].wrongAnswerTwo)", forState: .Normal)
            thirdOptionButton.setTitle("\(questions[index].wrongAnswerThree)", forState: .Normal)
            fourthOptionButton.setTitle("\(questions[index].wrongAnswerFour)", forState: .Normal)
        }
    }
    
    // This is an IBAction button to change the color of appearance to another one:
    @IBAction func changeAppearance(sender: AnyObject) {
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 228.0/255.0, blue: 196.0/255.0, alpha: 1)
        firstOptionButton.backgroundColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 30.0/255.0, alpha: 1)
        secondOptionButton.backgroundColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 30.0/255.0, alpha: 1)
        thirdOptionButton.backgroundColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 30.0/255.0, alpha: 1)
        fourthOptionButton.backgroundColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 30.0/255.0, alpha: 1)
        questionLabel.backgroundColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 30.0/255.0, alpha: 1)
    }
}