//
//  UserService.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Normalde socket ile haberleşmesi gerekiyor. Ancak neden socket entegre etmediğimi detaylıca tarafınıza ilettim.
 */
class UserService {

    /**
     Returns the question from the service according to User ID Value.
     -returns:
    CallBack return a UserModel
     -parameters:
        -id: from database user id
     */
    func getUser(id: Int, _ callBack: @escaping (UserModel) -> Void) {
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSON(data: data)

                let users = jsonResult.arrayValue
                let jsonUser = users[id - 1] // id 1den index 0 dan başladığı için - 1 yapıyorum.
                callBack(UserModel(json: jsonUser))
            } catch {
                // handle error
            }
        }
    }

    func checkUserJoker(id: Int, _ callBack: @escaping (Int) -> Void) {
        callBack(QuestionViewController.tempUserJoker)
    }

    func updateUserJoker(id: Int, _ callBack: @escaping (Int) -> Void) {
        callBack(QuestionViewController.tempUserJoker)
    }
}
