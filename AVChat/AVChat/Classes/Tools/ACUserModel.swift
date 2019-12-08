//
//  ACUserModel.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/6.
//  Copyright © 2019 AVChat. All rights reserved.
//

import Foundation

private var userModel = ACUserModel()
private var userInfo = userInfoModel()


class ACUserModel: NSObject {
    
    class var share : ACUserModel {

        userModel.userInfo = userInfoModel.share
        
        return userModel
    }
    class var remove : ACUserModel {
        
        userModel = ACUserModel()
        userModel.userInfo = userInfoModel.remove
        
        return userModel
    }
    var account : String!
    var password : String!
    var smsSessionId : String!
    
    var uid : String!
    var juid : String!
        

    // 用户个人信息
    var msg : String!
    var code : integer_t!
    var token : String!
    
    
    var userInfo : userInfoModel!
    
}


class userInfoModel: NSObject {
    
    class var share : userInfoModel {
        return userInfo
    }
    class var remove : userInfoModel {
        userInfo = userInfoModel()
        return userInfo
    }
    var uid : String!
    var userName : String!
    var password : String!
    var niceName : String!
    var terminalType : String!
    var gender : String!
    var headerImage : String!
    var status : String!
    var createtime : String!
}
