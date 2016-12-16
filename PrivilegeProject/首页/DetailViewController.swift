//
//  DetailViewController.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?//数据
    var showModel:ShowModel!{
    
        didSet{
        
            //加载数据表
            self.p_loadTableView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func p_loadTableView(){
     
        tableView = UITableView.init(frame: self.view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        //注册
        tableView?.register(DetailFooterCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView?.register(UINib.init(nibName: "DetailTopCell", bundle: nil), forCellReuseIdentifier: "DetailTopCell")
        self.view.addSubview(tableView!)
    }
    
    //代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTopCell", for: indexPath) as! DetailTopCell
            cell.showModel = showModel
            cell.selectionStyle = .none
            return cell
        }else{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailFooterCell
            cell.showModel = showModel
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 450
        }else{
        
            return DetailFooterCell .cellReturnHeightForModel(model: showModel);
        }
    }
    
}
