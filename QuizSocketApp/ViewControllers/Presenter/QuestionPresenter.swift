//
//  QuestionPresenter.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

struct QuestionViewData {
    var id: Int
    var question: String
    var opt1: String
    var opt2: String
    var opt3: String
    var opt4: String
    var correctIndex: Int
    
}

protocol QuestionView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setQuestion(question: QuestionViewData)
}

class QuestionPresenter {

    fileprivate let questionService: QuestionService?
    weak fileprivate var questionView: QuestionView?

    init(questionService: QuestionService) {
        self.questionService = questionService
    }

    func attachView(_ view: QuestionView) {
        self.questionView = view
    }

    func detachView() {
        self.questionView = nil
    }

    func getQuestion() {
        self.questionView?.startLoading()
        self.questionService?.getQuestion(id: 1, { (model) in
            self.questionView?.setQuestion(question: QuestionViewData(id: model.id, question: model.question, opt1: model.opt1, opt2: model.opt2, opt3: model.opt3, opt4: model.opt4, correctIndex: model.correctIndex))
        })
    }
}


