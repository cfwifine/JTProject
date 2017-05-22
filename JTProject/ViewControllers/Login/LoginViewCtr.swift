//
//  LoginViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewCtr: BaseViewCtr {
    
    var usernameView: UIView!
    var passwordView: UIView!
    var loginBtn    : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.initUI()
    }
    
    private func initUI() {
        //背景
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage(named: "login_bg")
        self.view.addSubview(bgImageView)
        
        let imageView = UIImageView(frame: .zero)
        let image = UIImage(named: "login_01")
        imageView.image = image
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(70*pSize)
        }
        
        //用户名
        usernameView = self.createUsernameView()
        self.view.addSubview(usernameView)
        usernameView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(imageView.snp.bottom).offset(66*pSize)
            make.height.equalTo(55*pSize)
        }
        
        //密码
        passwordView = self.createPasswordView()
        self.view.addSubview(passwordView)
        passwordView.snp.makeConstraints { (make) in
            make.size.equalTo(usernameView)
            make.top.equalTo(usernameView.snp.bottom)
            make.centerX.equalTo(usernameView)
        }
        
        //登录按钮
        loginBtn = CreateControl.createButton(frame: .zero, title: "登录", bgColor: UIColor(hexColor: "78d7bf"), titleColor: UIColor(hexColor: "dcf4ed"), font: UIFont.systemFont(ofSize: 16*pFont))
        loginBtn.tag = 20001
        loginBtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        CreateControl.createCorneRadius(view: loginBtn, radius: 40*pSize/2, borderWidth: 0, borderColor: .clear)
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30*pSize)
            make.right.equalTo(-30*pSize)
            make.top.equalTo(passwordView.snp.bottom).offset(40*pSize)
            make.height.equalTo(40*pSize)
        }
        
        let titles = ["忘记密码","体验一下"]
        var button: UIButton!
        for i in 0..<2 {
            button = CreateControl.createButton(frame: .zero, title: titles[i], bgColor: .clear, titleColor: UIColor(hexColor: "666666"), font: UIFont.systemFont(ofSize: 13*pFont))
            button.tag = 200+i
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
            self.view.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.top.equalTo(loginBtn.snp.bottom).offset(12*pSize)
                if i==0 {
                    make.left.equalTo(loginBtn)
                }else {
                    make.right.equalTo(loginBtn)
                }
            })
        }
        
        //分享按钮
        let images = ["login_06","login_07","login_08"]
        for i in 0..<3 {
            let button = UIButton(frame: .zero)
            let image = UIImage(named: images[i])
            button.setImage(image, for: .normal)
            CreateControl.createCorneRadius(view: button, radius: (image?.size.width)!/2, borderWidth: 0.5, borderColor: UIColor(hexColor: "e6e6e6e6"))
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
            button.tag = 300+i
            self.view.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.bottom.equalTo(-45*pSize)
                switch i {
                    case 0:
                        make.left.equalTo(self.view).offset(35*pSize)
                        break
                    case 1:
                        make.centerX.equalTo(self.view)
                        break
                    case 2:
                        make.right.equalTo(self.view).offset(-35*pSize)
                        break
                    default: break
                }
            })
        }
    }
    
    private func createUsernameView() ->UIView {
        let usernameView = CreateControl.createView(frame: .zero, bgColor: .clear)
        
        let usernameFiled = CreateControl.createTextFiled(frame: .zero, placeholder: "手机号码", textColor: UIColor(hexColor: "cccccc"), bgColor: .clear, font: UIFont.systemFont(ofSize: 16*pFont))
        usernameView.addSubview(usernameFiled)
        usernameFiled.tag = 5000
        usernameFiled.clearButtonMode = .whileEditing
        usernameFiled.delegate = self
        usernameFiled.snp.makeConstraints { (make) in
            make.top.equalTo(usernameView).offset(11*pSize)
            make.width.equalTo(230*pSize)
            make.right.equalTo(usernameView).offset(-30*pSize)
            make.height.equalTo(33*pSize)
        }
        
        let phoneIcon = UIImageView(frame: .zero)
        phoneIcon.image = UIImage(named: "login_02")
        usernameView.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(usernameFiled)
            make.left.equalTo(usernameView).offset(30*pSize)
            make.right.equalTo(usernameFiled.snp.left).offset(-15*pSize)
        }

        let line = CreateControl.createLabel(frame: .zero, text: "", bgColor: UIColor(hexColor: "cccccc"))
        usernameView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(usernameFiled.snp.bottom).offset(5)
            make.left.right.equalTo(usernameFiled)
            make.height.equalTo(0.5)
        }
        
        return usernameView
    }
    
    private func createPasswordView() ->UIView {
        let passwordView = CreateControl.createView(frame: .zero, bgColor: .clear)
        
        let passwordFiled = CreateControl.createTextFiled(frame: .zero, placeholder: "密码", textColor: UIColor(hexColor: "cccccc"), bgColor: .clear, font: UIFont.systemFont(ofSize: 16*pFont))
        passwordView.addSubview(passwordFiled)
        passwordFiled.tag = 5001
        passwordFiled.clearButtonMode = .whileEditing
        passwordFiled.isSecureTextEntry = true
        passwordFiled.delegate = self
        passwordFiled.snp.makeConstraints { (make) in
            make.top.equalTo(passwordView).offset(11*pSize)
            make.width.equalTo(230*pSize)
            make.right.equalTo(passwordView).offset(-30*pSize)
            make.height.equalTo(33*pSize)
        }
        
        let passIcon = UIImageView(frame: .zero)
        passIcon.image = UIImage(named: "login_03")
        passwordView.addSubview(passIcon)
        passIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(passwordFiled)
            make.left.equalTo(passwordView).offset(30*pSize)
            make.right.equalTo(passwordFiled.snp.left).offset(-15*pSize)
        }
        
        let line = CreateControl.createLabel(frame: .zero, text: "", bgColor: UIColor(hexColor: "cccccc"))
        passwordView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalTo(passwordFiled)
            make.top.equalTo(passwordFiled.snp.bottom).offset(5)
            make.height.equalTo(0.5)
        }
        
        return passwordView
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        switch sender.tag {
        case 200: //忘记密码
            print("忘记密码...")
            break
        case 201: //体验一下
            print("体验一下...")
            break
        case 300: //qq
            print("qq...")
            break
        case 301: //微信
            print("微信...")
            break
        case 302: //微博
            print("微博...")
            break
        case 20001: //登录
            self.loginRequest()
            break
        default:
            break
        }
    }
}

extension LoginViewCtr: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 5000 {
            
        }else if textField.tag == 5001 {
        
        }
        
        let userFiled = usernameView.viewWithTag(5000) as! UITextField
        let passFiled = passwordView.viewWithTag(5001) as! UITextField
        
        let isTure = (userFiled.text?.lengthOfBytes(using:  String.Encoding.utf8))! >= 11 && (passFiled.text?.lengthOfBytes(using: String.Encoding.utf8))! >= 5
        if  isTure{
            loginBtn.isEnabled = true
            loginBtn.setTitleColor(UIColor(hexColor:"ffffff"), for: .normal)
            loginBtn.backgroundColor = UIColor(hexColor: "30c29d")
        }else {
            loginBtn.isEnabled = false
            loginBtn.setTitleColor(UIColor(hexColor:"dcf4ed"), for: .normal)
            loginBtn.backgroundColor = UIColor(hexColor: "78d7bf")
           
        }
        
        return true
    }
}

//MARK:  ///网络请求
extension LoginViewCtr {
    fileprivate func loginRequest() {
        let userFiled = usernameView.viewWithTag(5000) as! UITextField
        let passFiled = passwordView.viewWithTag(5001) as! UITextField
        let parameters = [
            "user_no"  : userFiled.text!,
            "user_pwd" : passFiled.text!.md5(),
            "user_type": "2",
        ]
        CFClient.shared.loginClient(params: parameters, delegate: self)
    }
    
    override func requestFailure(key: String, error: Error) {}
    
    override func requestSuccess(key: String, data: [String : Any]) {
        super.requestSuccess(key: key, data: data)
        if self.code != "0000" {return;}
        //保存数据
<<<<<<< HEAD
        let sessionMemberID = data["sessionMemberID"] as? String ?? ""
        let sessionID = data["sessionID"] as! String? ?? ""
        GlobalVar.sharedInfo.sessionMemberID = sessionMemberID
        GlobalVar.sharedInfo.sessionID = sessionID
        GlobalVar.sharedInfo.saveValueToPlist(param: ["sessionMemberID":sessionMemberID,"sessionID":sessionID])
=======
        LoginUserObj().operationData(data: data)
        
>>>>>>> f98437913bb009e970cc3720ace378d03c6c8bc9
        self.dismiss(animated: true, completion: {
            self.shouldPresent = true
        })
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.rootViewCtr.switchRootViewToTabBarViewCtr()
    }
}
