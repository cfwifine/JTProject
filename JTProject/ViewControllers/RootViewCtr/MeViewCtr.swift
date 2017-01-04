//
//  MeViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    个人中心主页
 */

import UIKit

class MeViewCtr: BaseViewCtr {
    private var scrollView:  UIScrollView!
    private var contentView: UIView!
    private var infoView:    UIView!
    private var historyView: UIView!
    private var moduleView:  UIView!
    private var unitView:    UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.navigationItem.title = "个人中心"
        
        self.initUI()
    }
    
    private func initUI() {
        infoView    = self.initUserInfoView()
        historyView = self.initSugarHistoryView()
        moduleView  = self.initModuleView()
        
        scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = CGSize(width: 0, height: (120+160+160+30)*pSize)
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 49, 0))
        }
        
        contentView = CreateControl.createView(frame: .zero, bgColor: UIColor(hexColor:"f6f6f6"))
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo((120+160+160+30)*pSize)
        }
        
        contentView.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.top.equalTo(contentView)
            make.height.equalTo(120*pSize)
        }
        
        contentView.addSubview(historyView)
        historyView.snp.makeConstraints { (make) in
            make.top.equalTo(infoView.snp.bottom).offset(10*pSize)
            make.left.right.equalTo(contentView)
            make.height.equalTo(160*pSize)
        }
        
        contentView.addSubview(moduleView)
        moduleView.snp.makeConstraints { (make) in
            make.top.equalTo(historyView.snp.bottom).offset(10*pSize)
            make.left.right.equalTo(contentView)
            make.height.equalTo(160*pSize)
            
        }
    }
    
    private func initUserInfoView()-> UIView {
        let infoView = CreateControl.createView(frame: .zero, bgColor: UIColor(hexColor: "30c29d"))
        
        let headImgView = UIImageView(frame: .zero)
        CreateControl.createCorneRadius(view: headImgView, radius: 25*pSize, borderWidth: 2*pSize, borderColor: UIColor(hexColor: "30c29d", alpha: 0.5))
        headImgView.image = UIImage(named: "personalc_35")
        headImgView.tag = 1001
        infoView.addSubview(headImgView)
        headImgView.snp.makeConstraints { (make) in
            make.top.equalTo(13*pSize)
            make.left.equalTo(10*pSize)
            make.size.equalTo(CGSize(width: 50*pSize, height: 50*pSize))
        }
        
        let button = CreateControl.createButton(frame: .zero, title: "", bgColor: .clear)
        button.addTarget(self, action: #selector(infoViewClicked(sender:)), for: .touchUpInside)
        headImgView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(headImgView)
        }
        
        let uname = CreateControl.createLabel(frame: .zero, text: "阿姿猫", bgColor: .clear, textColor: .white, font: UIFont.systemFont(ofSize: 16*pFont))
        uname.tag =  1002
        infoView.addSubview(uname)
        uname.snp.makeConstraints { (make) in
            make.left.equalTo(headImgView.snp.right).offset(13*pSize)
            make.top.equalTo(17*pSize)
        }
        
        let cuname = CreateControl.createLabel(frame: .zero, text: "当前成员:", bgColor: .clear, textColor: .white, font: UIFont.systemFont(ofSize: 14*pFont))
        cuname.tag = 1003
        infoView.addSubview(cuname)
        cuname.snp.makeConstraints { (make) in
            make.left.equalTo(uname)
            make.top.equalTo(uname.snp.bottom).offset(13*pSize)
        }
        
        let line = CreateControl.createLabel(frame: .zero, text: "", bgColor: UIColor(hexColor: "e3e3e3"))
        infoView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(10*pSize)
            make.right.equalTo(-10*pSize)
            make.height.equalTo(0.5)
            make.bottom.equalTo(-40*pSize)
        }
        
        let countLabel = CreateControl.createLabel(frame: .zero, text: "账户余额:", bgColor: .clear, textColor: .white, font: UIFont.systemFont(ofSize: 14*pFont))
        infoView.addSubview(countLabel)
        countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10*pSize)
            make.centerY.equalTo(infoView.snp.bottom).offset(-20*pSize)
        }
        return infoView
    }
    
    private func initSugarHistoryView()-> UIView {
        let histroyView = CreateControl.createView(frame: .zero, bgColor: .white)
        
        let scrView = UIScrollView(frame: .zero)
        scrView.backgroundColor = UIColor.clear
        scrView.contentSize = CGSize(width: kScreenWidth*3, height: 0)
        scrView.tag = 2001
        scrView.showsHorizontalScrollIndicator = false
        scrView.isPagingEnabled = true
        histroyView.addSubview(scrView)
        scrView.snp.makeConstraints { (make) in
            make.edges.equalTo(histroyView)
        }
        
        let cntView = CreateControl.createView(frame: .zero, bgColor: .clear)
        cntView.tag = 2002
        scrView.addSubview(cntView)
        cntView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrView)
            make.height.equalTo(scrView)
            make.width.equalTo(kScreenWidth*3)
        }
        
        let titles = ["最近一周血糖情况", "最近一个月血糖情况", "最近三个月血糖情况"]
        let tipTitles = ["偏高", "正常", "偏低"]
        let tipImgs = ["personalc_05", "personalc_06", "personalc_07"]
        for i in 0..<3 {
            let sugarView = CreateControl.createView(frame: .zero, bgColor: .clear)
            sugarView.tag = 3001+i
            cntView.addSubview(sugarView)
            sugarView.snp.makeConstraints({ (make) in
                make.height.equalTo(cntView)
                make.width.equalTo(kScreenWidth)
                make.left.equalTo(CGFloat(i) * kScreenWidth)
                make.centerY.equalTo(cntView)
            })
            
            let icomImgView = UIImageView(frame: .zero)
            icomImgView.image = UIImage(named: "personalc_04")
            sugarView.addSubview(icomImgView)
            icomImgView.snp.makeConstraints({ (make) in
                make.left.equalTo(10*pSize)
                make.top.equalTo(15*pSize)
            })
            
            let titleLabel  = CreateControl.createLabel(frame: .zero, text: titles[i], bgColor: .clear , textColor: UIColor(hexColor: "666666"), font: UIFont.systemFont(ofSize: 13*pFont))
            sugarView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(icomImgView.snp.right).offset(6*pSize)
                make.centerY.equalTo(icomImgView)
            })
            
            for j in 0..<3 {
                //圆
                let circleView = CreateControl.createView(frame: CGRect(x: 0, y: 0, width: 70*pSize, height: 70*pSize), bgColor: .orange)
                circleView.tag = 30001+j
                sugarView.addSubview(circleView)
                circleView.snp.makeConstraints({ (make) in
                    make.size.equalTo(CGSize(width: 70*pSize, height: 70*pSize))
                    make.centerY.equalTo(sugarView)
                    if j == 0 {
                        make.right.equalTo(sugarView.snp.centerX).offset(-(37+35)*pSize)
                    }else if j == 1 {
                        make.centerX.equalTo(sugarView)
                    }else if j == 2 {
                        make.left.equalTo(sugarView.snp.centerX).offset((37+35)*pSize)
                    }
                })
                
                //指示label
                let tipLabel = CreateControl.createLabel(frame: .zero, text: tipTitles[j], bgColor: .clear, textColor: UIColor(hexColor: "000000"), font: UIFont.systemFont(ofSize: 13*pFont))
                sugarView.addSubview(tipLabel)
                tipLabel.snp.makeConstraints({ (make) in
                    make.left.equalTo(circleView.snp.centerX).offset(-5)
                    make.bottom.equalTo(sugarView).offset(-15*pSize)
                })
                
                let tipImg = UIImageView(frame: .zero)
                tipImg.image = UIImage(named: tipImgs[j])
                sugarView.addSubview(tipImg)
                tipImg.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(tipLabel)
                    make.right.equalTo(tipLabel.snp.left).offset(-6*pSize)
                })
            }
        }
        
        return histroyView
    }
    
    private func initModuleView()-> UIView {
        let moduleView = CreateControl.createView(frame: .zero, bgColor: .white)
        
        let titles = ["我的医生", "我的医生", "我的医生", "我的医生", "我的医生", "我的医生", "我的医生", "我的医生"]
        let imgs   = ["personalc_08", "personalc_09", "personalc_10", "personalc_11", "personalc_12", "personalc_13", "personalc_14", "personalc_15"]
        var lastButton: UIButton!
        for i in 0..<8 {
            let button = CreateControl.createButton(frame: .zero)
            button.addTarget(self, action: #selector(moduleViewClicked(sender:)), for: .touchUpInside)
            button.backgroundColor = UIColor.clear
            moduleView.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.width.height.equalTo(80*pSize)
                if (i==0) { //第一个
                    make.top.left.equalTo(moduleView)
                }else if (i % 4 == 0 && i != 0){ //每行第一个(除了第一行)
                    make.top.equalTo(lastButton.snp.bottom)
                    make.left.equalTo(moduleView)
                }else { //其他
                    make.top.equalTo(lastButton)
                    make.left.equalTo(lastButton.snp.right)
                }
            })
            lastButton = button
            
            let imgView = UIImageView.init(frame: .zero)
            imgView.image = UIImage(named: imgs[i])
            button.addSubview(imgView)
            imgView.snp.makeConstraints({ (make) in
                make.top.equalTo(20*pSize)
                make.centerX.equalTo(button)
            })
            
            let titleLabel = CreateControl.createLabel(frame: .zero, text: titles[i], bgColor: .clear, textColor: UIColor(hexColor:"000000"), font: UIFont.systemFont(ofSize: 12*pFont))
            button.addSubview(titleLabel)
            titleLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(button)
                make.top.equalTo(imgView.snp.bottom).offset(10*pSize)
            })
        }
        
        return moduleView
    }
}

//MARK: ///事件和代理方法
extension MeViewCtr {
    @objc fileprivate func infoViewClicked(sender: UIButton) {}
    
    @objc fileprivate func historyViewClicked(sender: UIButton) {}
    
    @objc fileprivate func moduleViewClicked(sender: UIButton) {}
}

//MARK: ///网络请求
extension MeViewCtr {
    
}


