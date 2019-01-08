//
//  AppDelegate.swift
//  QuizSocketApp
//
//  Created by Emre Celebi on 7.01.2019.
//  Copyright © 2019 cLb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

// var manager: SocketManager!
// var socketIOClient: SocketIOClient!

// self.ConnectToSocket()

// /   func ConnectToSocket() {
//
//        manager = SocketManager(socketURL: URL(string: "http://localhost:4001")!, config:
//        [.log(true), .compress])
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

