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
    let _phoneTextF = UITextField()
    let _paswdTextF = UITextField()
    
    var window = UIApplication.shared.keyWindow
    
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
        setTitle(title: "登录")
    }
    override func makeUI() -> Void {
        super.makeUI()
        _ = logoLabel
        _ = phoneTField
        _ = paswdTField
        _ = loginButton
        _ = registerButton
        _ = forgetButton
        addOtherLoginWays()
    }
    override func makeData() -> Void {
        super.makeData()
        logoLabel.text = "AVChat"
        phoneTField.placeholder = "请输入手机号"
        paswdTField.placeholder = "请输入登录密码"
        loginButton.setTitle("登录", for: UIControl.State.normal)
        registerButton.setTitle("注册", for: UIControl.State.normal)
        forgetButton.setTitle("忘记密码(暂未开通)", for: UIControl.State.normal)
        
        phoneTField.text = "123456"
        paswdTField.text = "123456"
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
        
        var phoneTField = UITextField()
        view.addSubview(phoneTField)
        phoneTField.snp.makeConstraints({ (make) in
            make.top.equalTo(logoLabel.snp.bottom).offset(kHight(h: 100))
            make.centerX.equalTo(view)
            make.width.equalTo(kWidth(w: 540))
        })
        phoneTField.textColor = UIColor(hex: 0x666666)
        phoneTField.font = kFont(F: 13)
        
        let leftView = UIView()
        phoneTField.leftView = leftView
        phoneTField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 80))
            make.height.equalTo(kHight(h: 80))
        })

        let imageView = UIImageView()
        leftView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(kWidth(w: 40))
            make.centerY.equalTo(leftView)
        })
        imageView.image = UIImage(named: "geren1")
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(phoneTField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(phoneTField.snp.bottom).offset(kHight(h: 20))
        })
        return phoneTField
    }()
    lazy var paswdTField: UITextField = {
        
        var paswdTField = UITextField()
        view.addSubview(paswdTField)
        paswdTField.snp.makeConstraints({ (make) in
            make.top.equalTo(phoneTField.snp.bottom).offset(kHight(h: 60))
            make.left.width.height.equalTo(phoneTField)
        })
        paswdTField.textColor = UIColor(hex: 0x666666)
        paswdTField.font = kFont(F: 13)
        
        let leftView = UIView()
        paswdTField.leftView = leftView
        paswdTField.leftViewMode = UITextField.ViewMode.always
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(kWidth(w: 80))
            make.height.equalTo(kHight(h: 80))
        })
        
        let imageView = UIImageView()
        leftView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(kWidth(w: 40))
            make.centerY.equalTo(leftView)
        })
        imageView.image = UIImage(named: "geren1")
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor(hex: 0xcccccc)
        lineView.snp.makeConstraints({ (make) in
            make.left.width.equalTo(paswdTField)
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(paswdTField.snp.bottom).offset(kHight(h: 20))
        })
        return paswdTField
    }()
    lazy var loginButton: UIButton = {
        var loginButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(loginButton)
        loginButton.backgroundColor = UIColor(hex: 0x00bc70)
        loginButton.titleLabel?.font = kFont(F: 15)
        loginButton.addTarget(self, action: #selector(loginButtonClick(button:)), for: UIControl.Event.touchUpInside)
        loginButton.snp.makeConstraints({ (make) in
            make.left.width.equalTo(paswdTField)
            make.top.equalTo(paswdTField.snp.bottom).offset(kHight(h: 80))
            make.height.equalTo(kHight(h: 80))
        })
        return loginButton
    }()
    lazy var registerButton: UIButton = {
        var registerButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(registerButton)
        registerButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        registerButton.titleLabel?.font = kFont(F: 12)
        registerButton.setTitleColor(UIColor(hex: 0x13ca80), for: UIControl.State.normal)
        registerButton.addTarget(self, action: #selector(registerButtonClick(button:)), for: UIControl.Event.touchUpInside)
        registerButton.snp.makeConstraints({ (make) in
            make.left.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom)
        })
        return registerButton
    }()
    lazy var forgetButton: UIButton = {
        var forgetButton = UIButton(type: UIButton.ButtonType.custom)
        view.addSubview(forgetButton)
        forgetButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        forgetButton.titleLabel?.font = kFont(F: 12)
        forgetButton.setTitleColor(UIColor(hex: 0x13ca80), for: UIControl.State.normal)
        forgetButton.addTarget(self, action: #selector(forgetButtonClick(button:)), for: UIControl.Event.touchUpInside)
        forgetButton.snp.makeConstraints({ (make) in
            make.right.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom)
        })
        return forgetButton
    }()
    func addOtherLoginWays() -> Void {
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "其他登录方式(暂未开通)"
        titleLabel.font = kFont(F: 10)
        titleLabel.textColor = UIColor(hex: 0x666666)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(kHight(h: -350))
        }
        let  hLineView = UIView()
        view.addSubview(hLineView)
        hLineView.backgroundColor = UIColor(hex: 0xcccccc)
        hLineView.snp.makeConstraints({ (make) in
            make.left.equalTo(kWidth(w: 200))
            make.width.equalTo(kWidth(w: 80*3+55*2))
            make.height.equalTo(kHight(h: 2))
            make.top.equalTo(titleLabel.snp.bottom).offset(kHight(h: 20))
        })
        
        let images = ["weixin","qq","xinlkang"]
        for (i,image) in images.enumerated() {
            let shareButton = UIButton(type: UIButton.ButtonType.custom)
            view.addSubview(shareButton)
            shareButton.setBackgroundImage(UIImage(named: image), for: UIControl.State.normal)
            shareButton.tag = i
            shareButton.addTarget(self, action: #selector(shareButtonClick(button:)), for: UIControl.Event.touchUpInside)
            shareButton.snp.makeConstraints({ (make) in
                make.left.equalTo(kWidth(w: CGFloat(200+i*(55+80))))
                make.width.height.equalTo(kWidth(w: 80))
                make.top.equalTo(titleLabel.snp.bottom).offset(kHight(h: 50))
            })
        }
        
       let titles = ["暂不登录","先去注册"]
        for (i,title) in titles.enumerated() {
            let funButton = UIButton(type: UIButton.ButtonType.custom)
            view.addSubview(funButton)
            funButton.setTitle(title, for: UIControl.State.normal)
            funButton.titleLabel?.font = kFont(F: 12)
            funButton.setTitleColor(UIColor(hex: 0x666666), for: UIControl.State.normal)
            funButton.tag = i
            funButton.addTarget(self, action: #selector(shareButtonClick(button:)), for: UIControl.Event.touchUpInside)
            funButton.snp.makeConstraints({ (make) in
                make.left.equalTo(kWidth(w: CGFloat(0+i*(370+5))))
                make.width.equalTo(kWidth(w: 370))
                make.height.equalTo(kHight(h: 80))
                make.bottom.equalTo(view).offset(kHight(h: -60))
            })
            if i == 0 {
                let  vLineView = UIView()
                view.addSubview(vLineView)
                vLineView.backgroundColor = UIColor(hex: 0xcccccc)
                vLineView.snp.makeConstraints({ (make) in
                    make.centerX.equalTo(view)
                    make.width.equalTo(kWidth(w: 2))
                    make.height.equalTo(kHight(h: 40))
                    make.centerY.equalTo(funButton)
                })
            }
        }
    }
    // MARK: 👉 点击方法
    @objc func loginButtonClick(button:UIButton) -> Void {
        UIApplication.shared.keyWindow?.rootViewController = ACTabbarViewController()
        return
        

        self.view.makeToastActivity(.center)
        
        ACHttpManager.share.userLogin(user_name: phoneTField.text!, password: paswdTField.text!, token: "", success: { (response) in
            print("==============登录\(response)")
            self.view.hideToastActivity()
            self.view.makeToast("登录"+response["appmsg"].stringValue)
            if response["appcode"].intValue == 1 {
                let userModel = ACUserModel.share
                userModel.uid = response["uid"].stringValue
                userModel.juid = response["juid"].stringValue
                UIApplication.shared.keyWindow?.rootViewController = ACTabbarViewController()
            }
        }) { (error) in
            
        }
    }
    @objc func registerButtonClick(button:UIButton) -> Void {
        navigationController?.pushViewController(ACRegisterViewController(), animated: true)
    }
    
    
    @objc func forgetButtonClick(button:UIButton) -> Void {
    }
    
    
    @objc func shareButtonClick(button:UIButton) -> Void {
        
    }
    override func backButtonClick(button: UIButton) {
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 1.0, animations: {
            window?.alpha = 0
            window?.frame = CGRect.zero
        }) { (finished) in
            exit(0)
        }
    }
}
