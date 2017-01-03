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
        self.view.backgroundColor = UIColor.green
        self.navigationItem.title = "个人中心"
        
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
        
        contentView = CreateControl.createView(frame: .zero, bgColor: .gray)
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
        let infoView = CreateControl.createView(frame: .zero, bgColor: .white)
        
        let headImgView = UIImageView(frame: .zero)
        headImgView.image = UIImage(named: "personalc_35")
        headImgView.tag = 1001
        infoView.addSubview(headImgView)
        headImgView.snp.makeConstraints { (make) in
            make.top.equalTo(15*pSize)
            make.left.equalTo(10*pSize)
        }
        
        return infoView
        
    }
    
    private func initSugarHistoryView()-> UIView {
        let histroyView = CreateControl.createView(frame: .zero, bgColor: .white)
        
        
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
            button.backgroundColor = UIColor.orange
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

extension MeViewCtr {
    @objc fileprivate func infoViewClicked(sender: UIButton) {}
    
    @objc fileprivate func historyViewClicked(sender: UIButton) {}
    
    @objc fileprivate func moduleViewClicked(sender: UIButton) {}
}


