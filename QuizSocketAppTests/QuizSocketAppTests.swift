//
//  QuizSocketAppTests.swift
//  QuizSocketAppTests
//
//  Created by Emre Celebi on 7.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import XCTest
@testable import QuizSocketApp

class QuizSocketAppTests: XCTestCase {

    var questionViewController: QuestionViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = (storyboard.instantiateInitialViewController() as! QuestionViewController)
        questionViewController = vc
        _ = questionViewController.view // To call viewDidLoad
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetQuestion() {
        questionViewController.questionPresenter.getQuestion(id: 0)
        XCTAssertEqual(questionViewController.questionToDisplay.question, "Asagidakilerden hangisi bir renktir?")
    }

    func testUserJoker() {
        questionViewController.questionPresenter.checkUserJoker(user: questionViewController.currentUser)
        XCTAssertEqual("3", "\(questionViewController.currentUser!.joker)")
    }

    func testPerformanceExample() {
        self.measure {
            
        }
    }
}
