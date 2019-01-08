//
//  ViewController.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 7.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    public static var tempUserJoker: Int = 3 // temp

    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblWildcard: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!

    var questionIndex: Int = 0

    fileprivate let questionPresenter = QuestionPresenter(questionService: QuestionService())
    fileprivate var questionToDisplay: QuestionViewData!

    fileprivate let userPresenter = UserPresenter(userService: UserService())
    fileprivate var currentUser: UserViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionPresenter.attachView(self)
        self.questionPresenter.getQuestion(id: questionIndex)

        self.userPresenter.attachView(self)
        self.userPresenter.getUser(id: 1)

    }

    @IBAction func AnswerAction(_ sender: UIButton) {
        self.checkAnswered(index: sender.tag - 1, correctIndex: questionToDisplay.correctIndex) // index 0 dan başlıyor ama tagleri 1 den başlattığım için -1 yapıyorum
    }
}

extension QuestionViewController: QuestionView {

    func startLoading() {
        print("question start loading")
    }

    func finishLoading() {
        print("question finish loading")
    }

    func updateQuestion(question: QuestionViewData) {
        questionToDisplay = question
        lblQuestionNumber.text = "\(questionIndex + 1)" // index 0'dan başladığı için +1
        lblQuestion.text = question.question
        let button1 = self.view.viewWithTag(1) as! UIButton
        let button2 = self.view.viewWithTag(2) as! UIButton
        let button3 = self.view.viewWithTag(3) as! UIButton
        let button4 = self.view.viewWithTag(4) as! UIButton
        button1.setTitle(question.opt1, for: .normal)
        button2.setTitle(question.opt2, for: .normal)
        button3.setTitle(question.opt3, for: .normal)
        button4.setTitle(question.opt4, for: .normal)
    }

    func checkAnswered(index: Int, correctIndex: Int) {
        if correctIndex == index {
            self.questionPresenter.correctAnswerQuestion(selectedIndex: index)
        } else {
            self.questionPresenter.wrongAnswerQuestion(selectedIndex: index)
        }
    }

    func newQuestion() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
            for i in 1...4 {
                self.view.viewWithTag(i)?.backgroundColor = UIColor.clear
            }
            self.questionIndex = self.questionIndex + 1
            self.questionPresenter.getQuestion(id: self.questionIndex)
        })
    }

    func correctAnswerQuestion(selectedIndex: Int) {
        self.view.viewWithTag(selectedIndex + 1)?.backgroundColor = UIColor.green
        self.questionPresenter.newQuestion()
    }

    func wrongAnswerQuestion(selectedIndex: Int) {
        self.view.viewWithTag(selectedIndex + 1)?.backgroundColor = UIColor.red
        self.view.viewWithTag(self.questionToDisplay!.correctIndex + 1)?.backgroundColor = UIColor.green
        self.userPresenter.checkUserJoker(user: currentUser)
    }
}


extension QuestionViewController: UserView {

    func setUser(user: UserViewData) {
        self.currentUser = user
    }

    func updateUserJokerUI(jokerCount: Int) {
        self.currentUser.joker = jokerCount
        self.lblWildcard.text = "Joker: \(jokerCount)"
    }

    func openJokerAlert() {
        let alert = UIAlertController(title: "Joker", message: "Use the joker", preferredStyle: .alert)
        let useWildCardAction = UIAlertAction(title: "Use Joker", style: .default) { (alert) in
            self.currentUser.joker = self.currentUser.joker - 1
            self.userPresenter.updateUserJoker(user: self.currentUser)

            self.questionPresenter.newQuestion()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            self.gameOver()
        }
        alert.addAction(useWildCardAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: nil)
    }

    func gameOver() {
        self.view.isUserInteractionEnabled = false
        print("GameOver")
    }
}
