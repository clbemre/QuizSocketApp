//
//  QuestionService.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

class QuestionService {

    /**
     Returns the question from the service according to ID Value.
     -returns:
     CallBack return a QuestionModel
     -parameters:
        -id: next question id
     */
    func getQuestion(id: Int, _ callBack: @escaping (QuestionModel) -> Void) {
        callBack(QuestionBank().questions[id])
    }
}

// TEST DATA
class QuestionBank {
    var questions = [QuestionModel]()
    init() {
        for i in 0...10 {
            let question = QuestionModel.init(id: i, question: "Soru \(i + 1)", opt1: "opt 1\(i)", opt2: "opt 2\(i)", opt3: "opt 3\(i)", opt4: "opt4\(i)", correctIndex: i % 2)
            questions.append(question)
        }
    }
}
