//
//  ShowViewController.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?//数据表
    var model:HomeModel!{
    
        didSet{
        
            //数据的加载
            self.p_loadData()
        }
    }//数据
    var dataArray = [ShowModel]()//数据数组
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //加载表
        self.p_loadTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //数据加载
    func p_loadData(){
    
        //获取plist文件里面的数据
        let path:String = Bundle.main.path(forResource: "super", ofType: "plist")!
        let array = NSArray.init(contentsOfFile: path)
        for dic in array!{
        
            let model = ShowModel.init(dic: dic as! [String : AnyObject])
            dataArray.append(model)
        }
    }

    func p_loadTableView(){
    
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 80
        //注册单元格
        tableView?.register(UINib.init(nibName: "ShowCell", bundle: nil), forCellReuseIdentifier: "ShowCell")
        self.view.addSubview(tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell
        cell.showModel = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
