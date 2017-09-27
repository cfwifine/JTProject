//
//  RecomendCell.swift
//  JTProject
//
//  Created by comv on 2016/12/29.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit
import Kingfisher

class RecomendCell: UITableViewCell {
    var icomImgView: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    
    var data = Dictionary<String,Any>() {
        didSet {
            titleLabel.text = data["hot_spot_title"] as! String?
            subTitleLabel.text = data["abstract_info"] as! String?
            let url = URL(string: data["photo_url"] as! String)
            let imageSource = ImageResource(downloadURL:url!)
            icomImgView.kf.setImage(with: imageSource)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    private func initUI() {
        icomImgView = UIImageView(frame: .zero)
        icomImgView.backgroundColor = UIColor.gray
        self.addSubview(icomImgView)
        icomImgView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(15*pSize)
            make.left.equalTo(self).offset(10*pSize)
            make.size.equalTo(CGSize(width: 149/2*pSize, height: 149/2*pSize*(120/149)))
        }
        
        titleLabel = CreateControl.createLabel(frame: .zero, text: "", bgColor: .clear, textColor: UIColor(hexColor: "000000"), font: UIFont.systemFont(ofSize: 15*pFont))
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(icomImgView.snp.right).offset(10*pSize)
            make.top.equalTo(icomImgView)
            make.right.equalTo(self).offset(-10*pSize)
        }
        
        subTitleLabel = CreateControl.createLabel(frame: .zero, text: "", bgColor: .clear, textColor: UIColor(hexColor: "999999"), font: UIFont.systemFont(ofSize: 12*pFont))
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byTruncatingTail
        self.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel).offset(10*pSize)
            make.top.equalTo(titleLabel.snp.bottom).offset(18*pSize)
        }
        
    }

}
