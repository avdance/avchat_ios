//
//  ACMsgCell.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/12.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ACMsgCell: UITableViewCell {
    var cellJson :JSON!{
        didSet{
            
            let url = URL(string: "http://ww2.sinaimg.cn/large/6a011e49jw1f1j01nj8g6j204f04ft8r.jpg")
            avatarImageView.kf.setImage(with: url)
            
            unreadNumberLabel.text = "99+"
            dateLabel.text = "1分钟前"
            nameLabel.text = "1号用户"
            lastMessageLabel.text = "1号用户发的信息"
        }
    }
    override func draw(_ rect: CGRect) {
        _ = avatarImageView
        _ = unreadNumberLabel
        _ = nameLabel
        _ = dateLabel
        _ = lastMessageLabel
    }
    
    lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.width.height.equalTo(kWidth(w: 48))
            make.centerY.equalTo(self)
        })
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 5.0;
        return avatarImageView
    }()
    
    
    lazy var unreadNumberLabel: UILabel = {
        var unreadNumberLabel = UILabel()
        addSubview(unreadNumberLabel)
        unreadNumberLabel.font = kFont(F: 7)
        unreadNumberLabel.alpha=0.0
        unreadNumberLabel.textColor = UIColor(hex: 0x333333)
        unreadNumberLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 58))
            make.height.equalTo(kWidth(w: 18))
            make.width.equalTo(kWidth(w: 18))
            make.top.equalTo(avatarImageView).offset(9)
        })
        return unreadNumberLabel
    }()

    
    
    lazy var nameLabel: UILabel = {
        var nameLabel = UILabel()
        addSubview(nameLabel)
        nameLabel.font = kFont(F: 11)
        nameLabel.textColor = UIColor(hex: 0x333333)
        nameLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(20)
            make.height.equalTo(kWidth(w: 20))
            make.width.equalTo(kWidth(w: 100))
            make.top.equalTo(avatarImageView)
        })
        return nameLabel
    }()
    
    
    lazy var dateLabel: UILabel = {
        var dateLabel = UILabel()
        addSubview(dateLabel)
        dateLabel.font = kFont(F: 11)
        dateLabel.textColor = UIColor(hex: 0x333333)
        dateLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(nameLabel.snp_right).offset(20)
            make.right.equalTo(kWidth(w: 20))
            make.height.equalTo(kWidth(w: 20))
            make.top.equalTo(avatarImageView)
        })
        return dateLabel
    }()
    
    lazy var lastMessageLabel: UILabel = {
        var lastMessageLabel = UILabel()
        addSubview(lastMessageLabel)
        lastMessageLabel.font = kFont(F: 11)
        lastMessageLabel.textColor = UIColor(hex: 0x333333)
        lastMessageLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(20)
            make.right.equalTo(kWidth(w: 20))
            make.height.equalTo(kWidth(w: 20))
            make.bottom.equalTo(avatarImageView)
        })
        return lastMessageLabel
    }()
    
    
    
    
}
