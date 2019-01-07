//
//  QuestionModel.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

struct QuestionModel {
    var id: Int
    var question: String
    var opt1: String
    var opt2: String
    var opt3: String
    var opt4: String
    var correctIndex: Int 
}
