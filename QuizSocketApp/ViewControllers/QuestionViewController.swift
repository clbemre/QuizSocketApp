//
//  ViewController.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 7.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblWildcard: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!

    // var manager: SocketManager!
    // var socketIOClient: SocketIOClient!

    fileprivate let questionPresenter = QuestionPresenter(questionService: QuestionService())
    fileprivate var questionToDisplay: QuestionViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
        // self.ConnectToSocket()
        self.questionPresenter.attachView(self)
        self.questionPresenter.getQuestion()

    }

    @IBAction func deneme(_ sender: Any) {
        self.lblQuestion.text = questionToDisplay.question
    }

//    func ConnectToSocket() {
//
//        manager = SocketManager(socketURL: URL(string: "http://localhost:4001")!, config: [.log(true), .compress])
//        socketIOClient = manager.defaultSocket
//
//        socketIOClient.on(clientEvent: .connect) { data, ack in
//            // print(data)
//            print("e:socket connected")
//        }
//
//        socketIOClient.on(clientEvent: .error) { (data, eck) in
//            // print(data)
//            print("e:socket error")
//        }
//
//        socketIOClient.on(clientEvent: .disconnect) { (data, eck) in
//            // print(data)
//            print("e:socket disconnect")
//        }
//
//        socketIOClient.on(clientEvent: SocketClientEvent.reconnect) { (data, eck) in
//            // print(data)
//            print("e:socket reconnect")
//        }
//
//        socketIOClient.on("FromAPI") { (data, ack) in
//            print("gelenData:\(data)")
//        }
//
//        socketIOClient.connect()
//    }
}

extension QuestionViewController: QuestionView {
    
    func startLoading() {
        print("start loading")
    }

    func finishLoading() {
        print("finish loading")
    }

    func setQuestion(question: QuestionViewData) {
        self.questionToDisplay = question
    }

}
