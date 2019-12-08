//
//  ACHttpManager.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/6.
//  Copyright © 2019 AVChat. All rights reserved.
//

import Foundation
import SwiftyJSON

private let manager = ACHttpManager()

// 网络管理工具
class ACHttpManager {
    
    class var share : ACHttpManager {
        
        return manager
    }
}

// 状态码
enum ACStatus:String {
    case 操作成功 = "SUCCESS"
    case 密码不正确 = "PERMISSION_DENIED"
}
// 认证
struct baseAuth {
    
    var  user:String
    var  password:String
    
    init() {
        user = "askcloudmd_api"
        password = "X9182#a54k"
    }
    init(_ user :String ,_ password :String){
        self.user = user
        self.password = password
    }
}

extension ACHttpManager {
    // MARK: - 手机号，密码登录
    func userLogin(user_name: String,password: String,token: String, success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()) {
        let otherUrl = "login"
        let params : [String : Any] = ["user_name": user_name,"password": password,"token": token]
        ACHttpTool.sharedInstance.postRequest(otherUrl: otherUrl, params: params, success: { (response) in
            success(response)
        }) { (error) in
            failture(error)
        }
    }
    
    
    // MARK: - 注册用户
    func registerUser(user_name: String,password: String,nice_name: String,mobile: String,token: String,success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()) {
        let otherUrl = "register"
        let params : [String : Any] = ["user_name":user_name,"password":password,"nice_name":nice_name,"mobile":mobile,"token":token]
        ACHttpTool.sharedInstance.postRequest(otherUrl: otherUrl, params: params, success: { (response) in
            success(response)
        }) { (error) in
            failture(error)
        }
    }
}
