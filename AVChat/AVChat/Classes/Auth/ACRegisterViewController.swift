//
//  ACRegisterViewController.swift
//  AVChat
//
//  Created by 黄龙山 on 2019/12/6.
//  Copyright © 2019 AVChat. All rights reserved.
//

import UIKit

class ACRegisterViewController: ACViewController {

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
        setTitle(title: "注册")
        rightButton.setTitle("登录", for: UIControl.State.normal)
    }
    override func makeUI() -> Void {
        super.makeUI()
        _ = logoLabel
        _ = phoneTField
        _ = codeTField
        _ = paswd1TField
        _ = userNameTField
        _ = nickTField
        _ = agreeButton
        _ = protocolButton
        _ = registerButton
    }
    override func makeData() -> Void {
        super.makeData()
        logoLabel.text = "AVChat"
        phoneTField.placeholder = "请输入手机号"
        codeTField.placeholder = "暂未开通（不需填）"
        paswd1TField.placeholder = "请输入注册密码"
        userNameTField.placeholder = "请输入用户名"
        nickTField.placeholder = "请输入昵称"
        agreeButton.setTitle("注册代表同意并接受", for: UIControl.State.normal)
        protocolButton.setTitle("AVChat用户协议", for: UIControl.State.normal)
        registerButton.setTitle("注册", for: UIControl.State.normal)
    }
    lazy var logoLabel: UILabel = {
        
        var logoLabel = UILabel()
        view.addSubview(logoLabel)
        logoLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(navView.snp.bottom).offset(kHight(h: 100))
            make.centerX.equalTo(view)
        })
        logoLabel.textColor = UIColor(hex: 0x333333)
        logoLabel.font = kFont(F: 20)
        return logoLabel
    }()
    lazy var phoneTField: UITextField = {
        
        var textField = UITextField()
        view.addSubview(textField)
        textField.snp.makeConstraints({ (make) in
            make.top.equalTo(logoLabel.snp.bottom).offset(kHight(h: 60))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
            make.height.equalTo(kHight(h: 80))
        })
        textField.keyboardType = UIKeyboardType.phonePad
        textField.textColor = UIColor(hex: 0x666666)
        textField.font = kFont(F: 12)
        
        let leftView = UIView()
        textField.leftView = leftView
        textField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 160))
            make.height.equalTo(kHight(h: 80))
        })
        
        let textLabel = UILabel()
        leftView.addSubview(textLabel)
        textLabel.text = "手机号"
        textLabel.font = kFont(F: 13)
        textLabel.textColor = UIColor(hex: 0x333333)
        textLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.centerY.equalTo(leftView)
        })
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(textField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(textField.snp.bottom)
        })
        return textField
    }()
    lazy var codeTField: UITextField = {
        
        var textField = UITextField()
        view.addSubview(textField)
        textField.snp.makeConstraints({ (make) in
            make.top.equalTo(phoneTField.snp.bottom).offset(kHight(h: 20))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
            make.height.equalTo(kHight(h: 80))
        })
        textField.keyboardType = UIKeyboardType.numberPad
        textField.textColor = UIColor(hex: 0x666666)
        textField.font = kFont(F: 12)
        
        let leftView = UIView()
        textField.leftView = leftView
        textField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 160))
            make.height.equalTo(kHight(h: 80))
        })
        
        let textLabel = UILabel()
        leftView.addSubview(textLabel)
        textLabel.text = "验证码"
        textLabel.font = kFont(F: 13)
        textLabel.textColor = UIColor(hex: 0x333333)
        textLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.centerY.equalTo(leftView)
        })
        
        let rightView = UIView()
        textField.rightView = rightView
        textField.rightViewMode = UITextField.ViewMode.always
        rightView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 180))
            make.height.equalTo(kHight(h: 80))
        })
        
        let sendButton = UIButton(type: UIButton.ButtonType.custom)
        rightView.addSubview(sendButton)
        sendButton.titleLabel?.font = kFont(F: 10)
        sendButton.backgroundColor = UIColor(hex: 0xe6e6e6)
        sendButton.setTitle("获取验证码", for: UIControl.State.normal)
        sendButton.setTitleColor(UIColor(hex: 0x00bc70), for: UIControl.State.normal)
        sendButton.addTarget(self, action: #selector(sendButtonClick(button:)), for: UIControl.Event.touchUpInside)
        sendButton.snp.makeConstraints({ (make) in
            make.top.equalTo(kHight(h: 15))
            make.right.width.equalTo(rightView)
            make.centerY.equalTo(rightView)
        })
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(textField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(textField.snp.bottom)
        })
        return textField
    }()
    lazy var paswd1TField: UITextField = {
        
        var textField = UITextField()
        view.addSubview(textField)
        textField.snp.makeConstraints({ (make) in
            make.top.equalTo(codeTField.snp.bottom).offset(kHight(h: 20))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
            make.height.equalTo(kHight(h: 80))
        })
        textField.textColor = UIColor(hex: 0x666666)
        textField.font = kFont(F: 12)
        
        let leftView = UIView()
        textField.leftView = leftView
        textField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 160))
            make.height.equalTo(kHight(h: 80))
        })
        
        let textLabel = UILabel()
        leftView.addSubview(textLabel)
        textLabel.text = "注册密码"
        textLabel.font = kFont(F: 13)
        textLabel.textColor = UIColor(hex: 0x333333)
        textLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.centerY.equalTo(leftView)
        })
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(textField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(textField.snp.bottom)
        })
        return textField
    }()
    lazy var userNameTField: UITextField = {
        
        var textField = UITextField()
        view.addSubview(textField)
        textField.snp.makeConstraints({ (make) in
            make.top.equalTo(paswd1TField.snp.bottom).offset(kHight(h: 20))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
            make.height.equalTo(kHight(h: 80))
        })
        textField.textColor = UIColor(hex: 0x666666)
        textField.font = kFont(F: 12)
        
        let leftView = UIView()
        textField.leftView = leftView
        textField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 160))
            make.height.equalTo(kHight(h: 80))
        })
        
        let textLabel = UILabel()
        leftView.addSubview(textLabel)
        textLabel.text = "用户名"
        textLabel.font = kFont(F: 13)
        textLabel.textColor = UIColor(hex: 0x333333)
        textLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.centerY.equalTo(leftView)
        })
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(textField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(textField.snp.bottom)
        })
        return textField
    }()
    
    
    lazy var nickTField: UITextField = {
        
        var textField = UITextField()
        view.addSubview(textField)
        textField.snp.makeConstraints({ (make) in
            make.top.equalTo(userNameTField.snp.bottom).offset(kHight(h: 20))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
            make.height.equalTo(kHight(h: 80))
        })
        textField.textColor = UIColor(hex: 0x666666)
        textField.font = kFont(F: 12)
        
        let leftView = UIView()
        textField.leftView = leftView
        textField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 160))
            make.height.equalTo(kHight(h: 80))
        })
        
        let textLabel = UILabel()
        leftView.addSubview(textLabel)
        textLabel.text = "昵称"
        textLabel.font = kFont(F: 13)
        textLabel.textColor = UIColor(hex: 0x333333)
        textLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 20))
            make.centerY.equalTo(leftView)
        })
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(textField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(textField.snp.bottom)
        })
        return textField
    }()
    
    
    lazy var agreeButton: UIButton = {
        let agreeButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(agreeButton)
        agreeButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        agreeButton.titleLabel?.font = kFont(F: 10)
        agreeButton.setTitleColor(UIColor(hex: 0x999999), for: UIControl.State.normal)
        agreeButton.setImage(UIImage(named:"xuanzhong"), for: UIControl.State.selected)
        agreeButton.setImage(UIImage(named:"yuan"), for: UIControl.State.normal)
        agreeButton.addTarget(self, action: #selector(agreeButtonClick(button:)), for: UIControl.Event.touchUpInside)
        agreeButton.snp.makeConstraints({ (make) in
            make.top.equalTo(nickTField.snp.bottom).offset(kHight(h: 20))
            make.left.equalTo(nickTField)
        })
        return agreeButton
    }()
    lazy var protocolButton: UIButton = {
        let protocolButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(protocolButton)
        protocolButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        protocolButton.titleLabel?.font = kFont(F: 10)
        protocolButton.setTitleColor(UIColor(hex: 0x00bc70), for: UIControl.State.normal)
        protocolButton.addTarget(self, action: #selector(protocolButtonClick(button:)), for: UIControl.Event.touchUpInside)
        protocolButton.snp.makeConstraints({ (make) in
            make.centerY.equalTo(agreeButton)
            make.left.equalTo(agreeButton.snp.right)
        })
        return protocolButton
    }()
    lazy var registerButton: UIButton = {
        let registerButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(registerButton)
        registerButton.titleLabel?.font = kFont(F: 15)
        registerButton.backgroundColor = UIColor(hex: 0x00bc70)
        registerButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        registerButton.addTarget(self, action: #selector(registerButtonClick(button:)), for: UIControl.Event.touchUpInside)
        registerButton.snp.makeConstraints({ (make) in
            make.left.width.equalTo(paswd1TField)
            make.top.equalTo(agreeButton.snp.bottom).offset(kHight(h: 60))
            make.height.equalTo(kHight(h: 80))
        })
        return registerButton
    }()
    @objc func sendButtonClick(button:UIButton) -> Void {
        if phoneTField.text?.count == 11 {
            button.isEnabled = false
            view.endEditing(true)
            
        }else{
            view.makeToast("手机格式错误")
        }
    }
    @objc func agreeButtonClick(button:UIButton) -> Void {
        button.isSelected = !button.isSelected
    }
    @objc func protocolButtonClick(button:UIButton) -> Void {
        //todo
    }
    @objc func registerButtonClick(button:UIButton) -> Void {
        let isEmpty = (phoneTField.text?.isEmpty)! /**&& (codeTField.text?.isEmpty)!*/ && (paswd1TField.text?.isEmpty)! && (userNameTField.text?.isEmpty)! && (nickTField.text?.isEmpty)!
        
        if isEmpty == true {
            view.makeToast("参数不能为空")
            return
        }

        ACHttpManager.share.registerUser(user_name: userNameTField.text!, password: paswd1TField.text!, nice_name: nickTField.text!, mobile: phoneTField.text!, token: "samsamsam", success: { (response) in
            self.view.makeToast(response["message"].stringValue)
            if response["code"].intValue == 0 {
                self.navigationController?.popViewController(animated: true)
            }
        }) { (error) in
            
        }
    }
    override func rightButtonClick(button: UIButton) {
        super.rightButtonClick(button: button)
        navigationController?.popViewController(animated: true)
    }
}

