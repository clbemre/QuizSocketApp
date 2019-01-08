//
//  QuestionView.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

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

    func newQuestion()

    /**
     The question is correct answer by user
     */
    func correctAnswerQuestion(selectedIndex: Int)

    /**
     The question is wrong answer by user
     */
    func wrongAnswerQuestion(selectedIndex: Int)
    
    /**
     - parameters:
     - user: from response UserModel convert to UserViewData
     */
    func setUser(user: UserViewData)
    
    /**
     Update User.joker = jokerCount & others
     */
    func updateUserJokerUI(jokerCount: Int)
    
    func openJokerAlert()
    
    func gameOver()
}
