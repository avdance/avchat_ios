//
//  ACMacroFile.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/5.
//  Copyright © 2019 AVChat. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher
import SnapKit
import Toast_Swift



//字体
func kFont(F:CGFloat) -> (UIFont) {
    return UIFont.systemFont(ofSize: F)
}
//MARK: - 尺寸
let SCREEN_WIDTH    = UIScreen.main.bounds.width
let SCREEN_HEIGHT   = UIScreen.main.bounds.height
func kWidth(w:CGFloat) -> CGFloat {
    return w * SCREEN_WIDTH / 750.0
}
func kHight(h:CGFloat) -> CGFloat {
    return h * SCREEN_HEIGHT / 1334.0
}

// MARK:- 自定义打印方法
func ACLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):(\(lineNum))-\(message)")
    #endif
}



// MARK:- 占位图片
let  EMPTY_PIC = "rebh"
