//
//  ACLoginViewController.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit
import SwiftyJSON

class ACLoginViewController: ACViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: 👉 入口自动调用makeNav()->makeUI()->makeData()
    override func makeNav() -> Void {
        super.makeNav()
        setTitle(title: "登录")
    }
    override func makeUI() -> Void {
        super.makeUI()
    }
    override func makeData() -> Void {
        super.makeData()
    }
    
    func getData(isHeader:Bool) -> Void {
    }
}
