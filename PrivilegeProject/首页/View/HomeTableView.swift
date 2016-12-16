//
//  HomeTableView.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit
//代理
protocol HomeTableViewDelegate{

    func tranDataToVC(item:HomeModel)//传递点击的内容给vc
}
class HomeTableView: UIView,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    var dataArray:[HomeModel]?
    var delegate:HomeTableViewDelegate?//代理
    override init(frame: CGRect) {
        super.init(frame: frame)
        //加载表方法
        self.p_loadTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //加载表
    func p_loadTableView(){
    
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        tableView?.delegate = self
        tableView?.dataSource = self
        //注册单元格
        tableView?.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.addSubview(tableView!)
    }
    
    //表的代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.homeModel = dataArray?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.tranDataToVC(item: (dataArray?[indexPath.row])!)//代理方法
    }
}
