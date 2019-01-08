//
//  UserPresenter.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 8.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import Foundation

/**
 This class sends the data from the service to the view.
 Need to UserService Reference for Request Api
 */
class UserPresenter {

    fileprivate let userService: UserService?
    weak fileprivate var userView: UserView?

    init(userService: UserService) {
        self.userService = userService
    }

    /**
     The ViewController class that implements the UserView protocol is sent here.
     - parameters:
        - view: Need to has UserView implemented controller
     */
    func attachView(_ view: UserView) {
        self.userView = view
    }

    /**
     Detach view from viewController
     */
    func detachView() {
        self.userView = nil
    }

    /**
     Fetch User Server Mediator
     */
    func getUser(id: Int) {
        self.userView?.startLoading()
        self.userService?.getUser(id: id, { (model) in
            let user = UserViewData.init(id: model.id, name: model.name, joker: model.joker)
            self.userView?.setUser(user: user)
            if model.joker >= 0 {
                self.userView?.updateUserJokerUI(jokerCount: model.joker)
            }
        })
    }

    /**
     Check User Joker Server Mediator
     */
    func checkUserJoker(user: UserViewData) {
        self.userService?.checkUserJoker(id: user.id, { (jokerCount) in
            if jokerCount >= 0 {
                self.userView?.updateUserJokerUI(jokerCount: jokerCount)
            }
            if jokerCount > 0 {
                self.userView?.openJokerAlert()
            } else {
                self.userView?.gameOver()
            }
        })
    }

    /**
     Update User Joker Server Mediator
     */
    func updateUserJoker(user: UserViewData, _ callBack: @escaping (Bool) -> Void) {
        QuestionViewController.tempUserJoker = user.joker
        self.userView?.startLoading()
        self.userService?.updateUserJoker(id: user.id, { (jokerCount) in
            self.userView?.updateUserJokerUI(jokerCount: jokerCount)
            callBack(true)
        })
    }

}
