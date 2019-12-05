//
//  ACTabbarViewController.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit
import DynamicColor

class ACTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupViewController()
    }
    
    
    let vcs : Array<ACViewController> = [ACMessageViewController(),ACContractsViewController(),ACOthersViewController(),ACMeViewController()]
    let titles = ["会话", "通讯录", "其它", "我"]
    let normalImgs : Array<NSString> = ["tabbar_chat","tabbar_contracts","tabbar_other","tabbar_me"]
    let selectImgs : Array<NSString> =  ["tabbar_chatSelect","tabbar_contractsSelect","tabbar_otherSelect","tabbar_meSelect"]
    var navVCs : Array<UIViewController> = []
    
    
    func setupViewController() {
        
        
        for (i,title) in titles.enumerated() {
            addChildVCToNavC(childVC: vcs[i], title: title as NSString, image: UIImage(named: normalImgs[i] as String)!, selectImage: UIImage(named: selectImgs[i] as String)!)
            navVCs.append(UINavigationController(rootViewController: vcs[i]))
        }
        self.viewControllers=navVCs
        self.tabBar.tintColor = UIColor(red: 17/255.0, green: 187/255.0, blue: 5/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        
    }
    
    
    func addChildVCToNavC(childVC:ACViewController,title:NSString,image:UIImage,selectImage:UIImage) -> Void {
        // alwaysOriginal 始终绘制图片原始状态，不使用Tint Color。
        childVC.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectImage.withRenderingMode(.alwaysOriginal)
        childVC.title = title as String
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
