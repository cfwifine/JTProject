//
//  MarketCell.swift
//  JTProject
//
//  Created by comv on 2016/12/29.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit
import SnapKit

class MarketCell: UITableViewCell {
    
    private var leftImgView:UIImageView!
    private var foodImgView:UIImageView!
    private var servImgView:UIImageView!
    private var deviceImgView:UIImageView!
    
    var data: Dictionary<String, Any> = Dictionary() {
        didSet {
            ///这里给控件赋值
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.initUI()
    }
    
    private func initUI() {
        leftImgView = UIImageView(frame: .zero)
        leftImgView.backgroundColor = UIColor.white
        self.addSubview(leftImgView)
        leftImgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.size.equalTo(CGSize(width: 140*pSize, height: 140*pSize*(380/280)))
        }
        
        foodImgView = UIImageView(frame: .zero)
        foodImgView.backgroundColor = UIColor.white
        self.addSubview(foodImgView)
        foodImgView.snp.makeConstraints { (make) in
            make.right.top.equalTo(self)
            make.size.equalTo(CGSize(width: 180*pSize, height: 180*pSize*(160/360)))
        }
        
        servImgView = UIImageView(frame: .zero)
        servImgView.backgroundColor = UIColor.white
        self.addSubview(servImgView)
        servImgView.snp.makeConstraints { (make) in
            make.top.equalTo(foodImgView.snp.bottom)
            make.left.equalTo(leftImgView.snp.right)
            make.size.equalTo(CGSize(width: 90*pSize, height: 90*pSize*(220/180)))
        }
        
        deviceImgView = UIImageView(frame: .zero)
        deviceImgView.backgroundColor = UIColor.white
        self.addSubview(deviceImgView)
        deviceImgView.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.equalTo(foodImgView.snp.bottom)
            make.size.equalTo(servImgView.snp.size)
        }
        
        //线
        var line: UILabel!
        for i in 0..<4 {
            line = UILabel(frame: .zero)
            line.backgroundColor = UIColor(hexColor: "e3e3e3")
            self.addSubview(line)
            switch i {
            case 0:
                line.snp.makeConstraints({ (make) in
                    make.top.equalTo(self)
                    make.height.equalTo(0.5)
                    make.left.right.equalTo(self)
                })
                break
            case 1:
                line.snp.makeConstraints({ (make) in
                    make.top.bottom.equalTo(self)
                    make.width.equalTo(0.5)
                    make.left.equalTo(self).offset(140*pSize)
                })
             break
            case 2:
                line.snp.makeConstraints({ (make) in
                    make.top.equalTo(foodImgView.snp.bottom)
                    make.height.equalTo(0.5)
                    make.right.equalTo(self)
                    make.left.equalTo(leftImgView.snp.right)
                })
                break
            case 3:
                line.snp.makeConstraints({ (make) in
                    make.top.equalTo(foodImgView.snp.bottom)
                    make.bottom.equalTo(self)
                    make.width.equalTo(0.5)
                    make.left.equalTo(servImgView.snp.right)
                })
                break
            default:
                break
            }
        }
    }
}
