//
//  UserView.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

/**
 This structure is used to print the data from the UserModel.
 */
struct UserViewData {
    var id: Int
    var name: String
    var joker: Int
}


protocol UserView: NSObjectProtocol {

    func startLoading()

    func finishLoading()

    /**
     - parameters:
     - user: from response UserModel convert to UserViewData
     */
    func setUser(user: UserViewData)

    func updateUserJokerUI(jokerCount: Int)
    
    func openJokerAlert()
    
    func gameOver()
    
}
