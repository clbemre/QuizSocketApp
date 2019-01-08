//
//  UserModel.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

/**
 This structure corresponds to the returned json value from the service.
 - Important:
 It is not used as a structure. It is converted to the UserViewData class.
 */
struct UserModel {
    var id: Int
    var name: String
    var joker: Int
}
