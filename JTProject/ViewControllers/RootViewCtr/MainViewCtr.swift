//
//  MainViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    首页
 */

import UIKit
import SnapKit

class MainViewCtr: BaseViewCtr {
    fileprivate static let recomendCellID = "RecomendCell"
    fileprivate static let marketCellID = "marketCellID"
    fileprivate var tableView: UITableView!
    fileprivate var headerView: UIView!
    
    fileprivate var recmendDict = Dictionary<String, Any>()
    fileprivate var sugarDict = Dictionary<String, Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
<<<<<<< HEAD
=======
        self.tabBarController?.navigationItem.title = "首页"
>>>>>>> f98437913bb009e970cc3720ace378d03c6c8bc9
        
        self.initHeaderView()
        self.initTableView()
        
        self.requestRecomendPaper(row: 10, page: 1)
        self.requestSugarData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "首页"
    }
    
    public func getInfo() {
    
    }
    
    private func initHeaderView() {
        headerView = CreateControl.createView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200), bgColor: UIColor.purple)
    }
    
    private func initTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecomendCell.classForCoder(), forCellReuseIdentifier: MainViewCtr.recomendCellID)
        tableView.register(MarketCell.classForCoder(), forCellReuseIdentifier: MainViewCtr.marketCellID)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableHeaderView = headerView
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderHeight = self.view.bounds.size.width*(80/640);
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0))
        }
    }
}

//MARK: ///Delegate
extension MainViewCtr: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return self.view.bounds.size.width*(380/640)
        }else {
            return self.view.bounds.size.width*(180/640)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CreateControl.createView(frame: .zero, bgColor: .white)
        header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.width*(80/640))
        
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 1
        }else {
            let dataArr = recmendDict["rows"] as? Array<Any>
            if let _ = dataArr {
                return dataArr!.count
            }else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section==0 {
            cell = tableView.dequeueReusableCell(withIdentifier: MainViewCtr.marketCellID)
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: MainViewCtr.recomendCellID)
            let dataArr = recmendDict["rows"]
            let dataDict = (dataArr as? Array<Any>)?[indexPath.row]
            if let dict = dataDict {
                (cell as! RecomendCell).data = (dict as? Dictionary<String, Any>)!
            }
        }
        cell.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selcted:\(indexPath.row)")
    }
    
}

//MARK: ///网络请求
extension MainViewCtr {
    func requestRecomendPaper(row: Int, page: Int) {
        CFClient.shared.recomendPaper(params: ["rows":row, "page":page], delegate: self)
    }
    
    func requestSugarData() {
        CFClient.shared.sugarData(delegate: self)
    }
    
    override func requestFailure(key: String, error: Error) {
        super.requestFailure(key: key, error: error)
    }
    
    override func requestSuccess(key: String, data: [String : Any]) {
        super.requestSuccess(key: key, data: data)
        if self.code != "0000" {return}
        if key == sugarUrl {
            
        }else if key == recomendUrl {
            recmendDict = (data["body"] as! [String: Any])
            tableView.reloadData()
        }
    }
}
