//
//  Questions.swift
//  PlayQuestionsApp
//
//  Created by Chawan Saeed on 6/7/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import Foundation

class Questions {
    
    var questionList = ""
    var rightAnswer = ""
    var wrongAnswerOne = ""
    var wrongAnswerTwo = ""
    var wrongAnswerThree = ""
    var wrongAnswerFour = ""
    
    init(questionList: String, rightAnswer: String, wrongAnswerOne: String, wrongAnswerTwo: String, wrongAnswerThree: String, wrongAnswerFour: String) {
        
        self.questionList = questionList
        self.rightAnswer = rightAnswer
        self.wrongAnswerOne = wrongAnswerOne
        self.wrongAnswerTwo = wrongAnswerTwo
        self.wrongAnswerThree = wrongAnswerThree
        self.wrongAnswerFour = wrongAnswerFour
    }
}
