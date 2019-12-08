//
//  AppDelegate.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 黄龙山. All rights reserved.
//

import UIKit



//MARK: - 引导页设置
private func showLeadpage() -> UIViewController{
    return ACLoginViewController()
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = ACNavController(rootViewController: showLeadpage())
        self.window?.makeKeyAndVisible()
        return true
    }

}

