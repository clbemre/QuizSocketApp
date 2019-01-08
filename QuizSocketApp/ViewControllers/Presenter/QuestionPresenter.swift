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
    weak fileprivate var questionView: QuestionView?

    init(questionService: QuestionService) {
        self.questionService = questionService
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
        -id: next question id
     */
    func getQuestion(id: Int) {
        self.questionView?.startLoading()
        self.questionService?.getQuestion(id: id, { (model) in
            self.questionView?.updateQuestion(question: QuestionViewData(id: model.id, question: model.question, opt1: model.opt1, opt2: model.opt2, opt3: model.opt3, opt4: model.opt4, correctIndex: model.correctIndex))
        })
    }

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
}


