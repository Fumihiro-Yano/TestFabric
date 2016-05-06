//
//  ViewController.swift
//  TestFabric
//
//  Created by 矢野史洋 on 2016/05/06.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let loginButton = TWTRLogInButton(logInCompletion: {
            session, error in
            if session != nil {
                let timelineVC = TimelineViewController()
                timelineVC.userId = session?.userID
                print(session!.userName)
                print(session?.userID)
                UIApplication.sharedApplication().keyWindow?.rootViewController = timelineVC
            } else {
                print(error!.localizedDescription)
            }
        })
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

