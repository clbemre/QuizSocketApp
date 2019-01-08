//
//  UserService.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

class UserService {

    /**
     Returns the question from the service according to User ID Value.
     -returns:
    CallBack return a UserModel
     -parameters:
        -id: from database user id
     */
    func getUser(id: Int, _ callBack: @escaping (UserModel) -> Void) {
        let userModel = UserModel.init(id: 1, name: "Emre", joker: QuestionViewController.tempUserJoker)
        callBack(userModel)
    }

    func checkUserJoker(id: Int, _ callBack: @escaping (Int) -> Void) {
        callBack(QuestionViewController.tempUserJoker)
    }

    func updateUserJoker(id: Int, _ callBack: @escaping (Int) -> Void) {
        callBack(QuestionViewController.tempUserJoker)
    }
}
