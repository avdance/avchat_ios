//
//  ACHttpTool.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/6.
//  Copyright © 2019 AVChat. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

private let share = ACHttpTool()
// 网络管理工具
class ACHttpTool: NSObject {
    
    var timeout: TimeInterval = 30
    var fileUrl: String = "https://phab.avdance.top:3000/api/"
    var baseUrl: String = "https://phab.avdance.top:3000/api/"
    
    class var sharedInstance : ACHttpTool {
        return share
    }
}


extension ACHttpTool {
    //MARK: - GET 请求
    func getRequest(otherUrl: String, params : [String : Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()) {
        print("====>>>url = \(baseUrl.appending(otherUrl)),params=\(params)")
        Alamofire.request(baseUrl.appending(otherUrl), method: .get, parameters: params)
            .responseJSON { (response) in/*这里使用了闭包*/
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    success(json)
                    //print("======>>>返回状态 = \(json["appcode"].intValue)")
                    ACLog(json)
                case .failure(let error):
                    failture(error)
                    ACLog("error:\(error)")
                }
        }
    }
    //MARK: - POST 请求
    func postRequest(otherUrl : String, params : [String : Any],success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()) {
        let headers: HTTPHeaders = [
            "Content-type":"application/json"
        ]
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = timeout
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        manager.request(baseUrl+otherUrl,method: .post, parameters: params, encoding: JSONEncoding.default, headers:headers)
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    if let value = response.result.value as? [String: AnyObject] {
                        let json = JSON(value)
                        success(json)
                        ACLog("json:\(json)")
                    }
                case .failure(let error):
                    failture(error)
                    ACLog("error:\(error)")
                }
        }
    }
}
