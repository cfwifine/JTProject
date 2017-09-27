//
//  GuidUserViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    引导页
 */

import UIKit

class GuidUserViewCtr: BaseViewCtr {
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        self.initUI()
    }

    private func initUI() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: 4.0*kScreenWidth, height: 0)
        self.view.addSubview(scrollView)
    
        let colors = [UIColor(hexColor:"5fabdc"),UIColor(hexColor:"65c6b9"),UIColor(hexColor:"fbc746"),UIColor(hexColor:"fca151")]
        let titles = ["首页焕然一新", "掌控商城升级", "全新健康评估", "个人中心升级"]
        let subTitles = ["全新视觉感官，极限操作体验", "选购商品更流畅，便捷支付更安全", "健康评估入口整合，时刻了解身体状况", "清晰掌握个人信息，精准定位个性化需求"]
        for i in 0..<4 {
            var path: String!
            if kScreenWidth==414 {
               path = Bundle.main.path(forResource: "guide_0\(i+1)@3x.png", ofType: nil)
            }else {
               path = Bundle.main.path(forResource: "guide_0\(i+1)@2x.png", ofType: nil)
            }
            
            let guidView = self.createGuidView(frame: CGRect(x: CGFloat(i)*kScreenWidth, y: 0, width: kScreenWidth, height: kScreenHeight), bgColor: colors[i], imagePath: path, title: titles[i], subTitle: subTitles[i])
            scrollView.addSubview(guidView)
            
            if i==3 {
                let beginBtn = CreateControl.createButton(frame: .zero, title: "立即体验", bgColor: .clear, titleColor: UIColor(hexColor:"ffffff"), font: UIFont.systemFont(ofSize: 16*pFont))
                beginBtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
                CreateControl.createCorneRadius(view: beginBtn, radius: 5*pSize, borderWidth: 1.0, borderColor: UIColor(hexColor: "ffffff"))
                guidView.addSubview(beginBtn)
                beginBtn.snp.makeConstraints({ (make) in
                    make.bottom.equalTo(guidView).offset(-41*pSize)
                    make.centerX.equalTo(guidView)
                    make.size.equalTo(CGSize(width: 210*pSize, height: 44*pSize))
                })
            }
        }
    }
    
    private func createGuidView(frame: CGRect, bgColor: UIColor, imagePath: String, title: String, subTitle: String) ->UIView {
        let guidView = CreateControl.createView(frame: frame, bgColor: bgColor)
        
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(contentsOfFile: imagePath)
        guidView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(guidView)
            make.top.equalTo(35*pSize)
        }
        
        let titleLabel = CreateControl.createLabel(frame: .zero, text: title, bgColor: .clear, textColor: UIColor(hexColor: "ffffff"), font: UIFont.systemFont(ofSize: 27*pFont))
        guidView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(35*pSize)
            make.centerX.equalTo(guidView)
        }
        
        let subTitleLabel = CreateControl.createLabel(frame: .zero, text: subTitle, bgColor: .clear, textColor: UIColor(hexColor: "ffffff"), font: UIFont.systemFont(ofSize: 15*pFont))
        guidView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12*pSize)
            make.centerX.equalTo(guidView)
        }
        return guidView
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        appDelegate.rootViewCtr.switchRootViewToTabBarViewCtr()
    }
}

extension GuidUserViewCtr: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("offsetX："+"\(scrollView.contentOffset.x)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end...")
    }
}
