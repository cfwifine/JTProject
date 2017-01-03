//
//  BannerView.swift
//  JTProject
//
//  Created by comv on 2016/12/30.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit
import SnapKit

class BannerView: UIView {
    var des: String? {
        didSet {
            if let value = des {
                desLabel.text = value
            }
        
        }
    }
    var img: UIImage? {
        didSet {
        
        }
    }
    
    private var desLabel: UILabel!
    private var iconImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        super.init(frame: CGRect(x: 0, y: -40*pSize, width: (appDelegate.window?.bounds.size.width)!, height: 40*pSize))
        self.initUI()
        self.backgroundColor = UIColor(hexColor: "383838")
        window?.addSubview(self)
        
    }
    
    private func initUI() {
        desLabel = CreateControl.createLabel(frame: .zero, text: "", bgColor: .clear, textColor: .white, font: UIFont.systemFont(ofSize: 14*pFont))
        self.addSubview(desLabel)
        desLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
    }
    
    private func hide(){
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = CGRect(x: 0, y: -40*pSize, width: (appDelegate.window?.bounds.size.width)!, height: 40*pSize)
        }, completion: {finishied in
            
        })
    }
    
    func show(des: String?){
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        desLabel.text = des
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = CGRect(x: 0, y: 0, width: (appDelegate.window?.bounds.size.width)!, height: 40*pSize)
        }, completion: {finishied in
            let time: TimeInterval = 3.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.hide()
            }
        })
        
    }

}
