//
//  ViewController.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 7.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    public static var tempUserJoker: Int = 3 // temp test data

    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblWildcard: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!

    // Current question index
    var questionIndex: Int = 0

    let questionPresenter =
        QuestionPresenter(questionService: QuestionService(), userService: UserService())
    var questionToDisplay: QuestionViewData!
    var currentUser: UserViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach View to QuestionPresenter
        self.questionPresenter.attachView(self)
        self.questionPresenter.getUser(id: 1)
        self.questionPresenter.getQuestion(id: questionIndex)
    }

    @IBAction func AnswerAction(_ sender: UIButton) {
        self.view.isUserInteractionEnabled = false
        self.questionPresenter.checkCorrectQuestion(questionIndex: questionIndex, selectedIndex: sender.tag - 1)
    }
}

extension QuestionViewController: QuestionView {

    func startLoading() {
        print("start loading")
    }

    func finishLoading() {
        print("finish loading")
    }

    func updateQuestion(question: QuestionViewData) {
        questionToDisplay = question
        lblQuestionNumber.text = "\(questionIndex + 1)" // index 0'dan başladığı için +1
        lblQuestion.text = question.question
        // Bütün buttonlara tag verildi ve tagler üzerinden erişiliyor.
        let button1 = self.view.viewWithTag(1) as! UIButton
        let button2 = self.view.viewWithTag(2) as! UIButton
        let button3 = self.view.viewWithTag(3) as! UIButton
        let button4 = self.view.viewWithTag(4) as! UIButton
        
        button1.setTitle(question.opt1, for: .normal)
        button2.setTitle(question.opt2, for: .normal)
        button3.setTitle(question.opt3, for: .normal)
        button4.setTitle(question.opt4, for: .normal)
    }

    /**
     Get question from QuestionPresenter
     */
    func newQuestion() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
            for i in 1...4 {
                self.view.viewWithTag(i)?.backgroundColor = UIColor.clear
            }

            self.view.isUserInteractionEnabled = true
            self.questionIndex = self.questionIndex + 1
            self.questionPresenter.getQuestion(id: self.questionIndex)
        })
    }

    /**
     Correct answer question
     */
    func correctAnswerQuestion(selectedIndex: Int) {
        self.view.viewWithTag(selectedIndex + 1)?.backgroundColor = UIColor.green
        self.questionPresenter.newQuestion()
    }

    /**
     Wrong answer question
     */
    func wrongAnswerQuestion(selectedIndex: Int) {
        self.view.viewWithTag(selectedIndex + 1)?.backgroundColor = UIColor.red
        self.view.viewWithTag(self.questionToDisplay!.correctIndex + 1)?.backgroundColor = UIColor.green
        self.questionPresenter.checkUserJoker(user: currentUser)
    }

    //// For user operations ////

    /**
     Set current user
     */
    func setUser(user: UserViewData) {
        self.currentUser = user
    }

    /**
     Update UI for JOKER
     */
    func updateUserJokerUI(jokerCount: Int) {
        self.currentUser.joker = jokerCount
        self.lblWildcard.text = "Joker: \(jokerCount)"
    }

    /**
     Open alert and if user has joker use - new question
     */
    func openJokerAlert() {
        let alert = UIAlertController(title: "Joker", message: "Use the joker", preferredStyle: .alert)
        let useWildCardAction = UIAlertAction(title: "Use Joker", style: .default) { (alert) in
            self.currentUser.joker = self.currentUser.joker - 1
            self.questionPresenter.updateUserJoker(user: self.currentUser, { (result) in
                if result {
                    self.questionPresenter.newQuestion()
                }
            })

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            self.gameOver()
        }
        alert.addAction(useWildCardAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: nil)
    }

    /**
     Game Over
     */
    func gameOver() {
        self.view.isUserInteractionEnabled = false
        print("GameOver")
    }
}

