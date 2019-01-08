//
//  QuestionView.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation
/**
 This structure is used to print the data from the QuestionModel.
 */
struct QuestionViewData {
    var id: Int
    var question: String
    var opt1: String
    var opt2: String
    var opt3: String
    var opt4: String
    var correctIndex: Int
}

/**
 This protocol is used to perform operations on QuestionViewController.
 */
protocol QuestionView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    /**
     The question is printed and updated/printed.
     - parameters:
        - question: QuestionViewData is check nil or not nil
     */
    func updateQuestion(question: QuestionViewData)
    /**
     The correctness of the problem is checked.
     
     - parameters:
        - index: Selected user option index
        - correctIndex: Question Correct Option
     */
    func checkAnswered(index: Int, correctIndex: Int)
    
    func newQuestion()
    
    func correctAnswerQuestion(selectedIndex: Int)
    
    func wrongAnswerQuestion(selectedIndex: Int)
}
