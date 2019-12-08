//
//  ACOthersViewController.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit
import SwiftyJSON

class ACOthersViewController: ACViewController {
    var othersDataJson = JSON()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
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
        setbackButtonHide(hide: true)
        setTitle(title: "会话")
    }
    override func makeUI() -> Void {
        super.makeUI()
        _ = tableView
    }
    override func makeData() -> Void {
        super.makeData()
        
//        self.othersDataJson=[{"title":"模块1","title":"功能描述"},{"title":"模块2","title":"功能描述"},{"title":"模块3","title":"功能描述"}]
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
}


extension ACOthersViewController:UITableViewDelegate,UITableViewDataSource{
    // MARK: 👉 UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return othersDataJson.arrayValue.count
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as? ACOthersCell
        if cell == nil {
            cell = ACOthersCell(style: .default, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        
        //cell?.cellJson = othersDataJson[indexPath.row]
        switch indexPath.row {
        case 0:
            cell?.cellJson=JSON(["title":"连接","detail":"负责人"])
            break
        case 1:
            cell?.cellJson=JSON(["title":"加入房间","detail":"负责人"])
            break
        default:
            cell?.cellJson=JSON(["title":"自己选择模块","detail":"自己填写负责人"])
            break
        }
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //todo
    }
}


// MARK: 👉 ACOthersCell
class ACOthersCell:UITableViewCell {
    var cellJson :JSON!{
        didSet{
            leftLabel.text = cellJson["title"].stringValue + " : " + cellJson["detail"].stringValue
        }
    }
    override func draw(_ rect: CGRect) {
        _ = leftLabel
    }
    
    lazy var leftLabel: UILabel = {
        var leftLabel = UILabel()
        addSubview(leftLabel)
        leftLabel.font = kFont(F: 11)
        leftLabel.textColor = UIColor(hex: 0x333333)
        leftLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.width.height.equalTo(kWidth(w: 400))
            make.centerY.equalTo(self)
        })
        return leftLabel
    }()
}
