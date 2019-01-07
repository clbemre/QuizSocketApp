//
//  QuestionService.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

class QuestionService {

    func getQuestion(id: Int, _ callBack: @escaping (QuestionModel) -> Void) {
        let model = QuestionModel.init(id: 1, question: "Soru 1", opt1: "opt 1", opt2: "opt 2", opt3: "opt 3", opt4: "opt4", correctIndex: 1)
        callBack(model)
    }
}
