//
//  QuestionModel.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation
import SwiftyJSON

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

extension QuestionModel {
    init(json: JSON) {
        self.id = json["id"].intValue
        self.question = json["question"].stringValue
        self.opt1 = json["option1"].stringValue
        self.opt2 = json["option2"].stringValue
        self.opt3 = json["option3"].stringValue
        self.opt4 = json["option4"].stringValue
        self.correctIndex = json["correctIndex"].intValue

    }
}
