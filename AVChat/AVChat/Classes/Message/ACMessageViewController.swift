//
//  ACMessageViewController.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit
import SwiftyJSON

class ACMessageViewController: ACViewController {
    
    
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
        setTitle(title: "AVChat")
    }
    override func makeUI() -> Void {
        super.makeUI()
        _ = tableView
    }
    override func makeData() -> Void {
        super.makeData()
    }
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = kWidth(w: 130)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints({ (make) in
            make.width.left.bottom.equalTo(view)
            make.top.equalTo(navView.snp.bottom)
        })

        return tableView
    }()
    
    
    func getData(isHeader:Bool) -> Void {
    }
}
