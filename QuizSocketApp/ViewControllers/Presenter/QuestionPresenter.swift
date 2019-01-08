//
//  QuestionPresenter.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

/**
 This class sends the data from the service to the view.
 Need to QuestionService Reference for Request Api
 */
class QuestionPresenter {

    fileprivate let questionService: QuestionService?
    fileprivate let userService: UserService?
    weak fileprivate var questionView: QuestionView?

    init(questionService: QuestionService, userService: UserService) {
        self.questionService = questionService
        self.userService = userService
    }
    /**
     The ViewController class that implements the QuestionView protocol is sent here.
     - parameters:
        - view: Need to has QuestionView implemented controller
     */
    func attachView(_ view: QuestionView) {
        self.questionView = view
    }

    /**
        Detach view from viewController
     */
    func detachView() {
        self.questionView = nil
    }

    /**
        Service Request mediator
     - parameters:
        - id: next question id
     */
    func getQuestion(id: Int) {
        self.questionView?.startLoading()
        self.questionService?.getQuestion(id: id, { (model) in
            self.questionView?.updateQuestion(question: QuestionViewData(id: model.id, question: model.question, opt1: model.opt1, opt2: model.opt2, opt3: model.opt3, opt4: model.opt4, correctIndex: model.correctIndex))
        })
    }

    /**
     Check the question answer mediator server
     - parameters:
        - questionIndex: this question Index
        - selectedIndex: this selected Index by User
     */
    func checkCorrectQuestion(questionIndex: Int, selectedIndex: Int) {
        self.questionView?.startLoading()
        self.questionService?.checkCorrectQuestion(questionIndex: questionIndex, selectedIndex: selectedIndex, { (result) in
            if result {
                self.questionView?.correctAnswerQuestion(selectedIndex: selectedIndex)
            } else {
                self.questionView?.wrongAnswerQuestion(selectedIndex: selectedIndex)
            }
        })
    }

    func newQuestion() {
        self.questionView?.newQuestion()
    }

    /////

    /**
     Fetch User Server Mediator
     */
    func getUser(id: Int) {
        self.questionView?.startLoading()
        self.userService?.getUser(id: id, { (model) in
            let user = UserViewData.init(id: model.id, name: model.name, joker: model.joker)
            self.questionView?.setUser(user: user)
            if model.joker >= 0 {
                self.questionView?.updateUserJokerUI(jokerCount: model.joker)
            }
        })
    }

    /**
     Check User Joker Server Mediator
     */
    func checkUserJoker(user: UserViewData) {
        self.userService?.checkUserJoker(id: user.id, { (jokerCount) in
            if jokerCount >= 0 {
                self.questionView?.updateUserJokerUI(jokerCount: jokerCount)
            }
            if jokerCount > 0 {
                self.questionView?.openJokerAlert()
            } else {
                self.questionView?.gameOver()
            }
        })
    }

    /**
     Update User Joker Server Mediator
     */
    func updateUserJoker(user: UserViewData, _ callBack: @escaping (Bool) -> Void) {
        QuestionViewController.tempUserJoker = user.joker
        self.questionView?.startLoading()
        self.userService?.updateUserJoker(id: user.id, { (jokerCount) in
            self.questionView?.updateUserJokerUI(jokerCount: jokerCount)
            callBack(true)
        })
    }
}


