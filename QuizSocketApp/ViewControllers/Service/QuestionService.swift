//
//  QuestionService.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation
import SwiftyJSON

class QuestionService {

    /**
     Returns the question from the service according to ID Value.
     -returns:
     CallBack return a QuestionModel
     -parameters:
        -id: next question id
     */
    func getQuestion(id: Int, _ callBack: @escaping (QuestionModel) -> Void) {
        // şuanda id yerine index gönderiliyor
        if let path = Bundle.main.path(forResource: "questions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSON(data: data)

                let questions = jsonResult.arrayValue
                let jsonQuestion = questions[id]
                callBack(QuestionModel(json: jsonQuestion))
            } catch {
                // handle error
            }
        }
    }
}
