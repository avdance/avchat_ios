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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints({ (make) in
            make.width.left.bottom.equalTo(view)
            make.top.equalTo(navView.snp.bottom)
        })

        return tableView
    }()
    
    
    func getData(isHeader:Bool) -> Void {
    }
}



extension ACMessageViewController:UITableViewDelegate,UITableViewDataSource{
    // MARK: 👉 UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return othersDataJson.arrayValue.count
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as? ACMsgCell
        if cell == nil {
            cell = ACMsgCell(style: .default, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        cell?.cellJson=JSON()
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //todo
    }
    
    
    
    
    /*左滑删除*/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteRowAction = UITableViewRowAction.init(style: .destructive, title: "删除会话") { (action, indexPath) in
        }
        deleteRowAction.backgroundColor = UIColor.orange
        
        return [deleteRowAction]
    }
}


