//
//  QuestionModel.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

/**
    This structure corresponds to the returned json value from the service.
 - Important:
 It is not used as a structure. It is converted to the QuestionViewData class.
 */

struct QuestionModel {
    var id: Int
    var question: String
    var opt1: String
    var opt2: String
    var opt3: String
    var opt4: String
    var correctIndex: Int
}
