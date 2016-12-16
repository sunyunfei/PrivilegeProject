//
//  HomeViewController.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,HomeTableViewDelegate,HomeCollectionViewDelegate {

    var footView:UIView?
    var tableView:HomeTableView? = nil//表试图
    var collectionView:HomeCollectionView? = nil //九宫格视图
    var dataArray:[HomeModel] = []//数据
    override func viewDidLoad() {
        super.viewDidLoad()

        //数据加载
        self.p_loadData()
        //加载头部的滑动
        self.p_loadTopScrollView()
        //加载表试图
        self.p_loadTableView()
        //加载九宫格视图
        self.p_loadCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //数据加载
    func p_loadData(){
    
        let path:String = Bundle.main.path(forResource: "home", ofType: "plist")!
        let originArray:NSArray? = NSArray.init(contentsOfFile: path)
        for dic in originArray!{
        
            let homeModel = HomeModel.init(dic:dic as! [String : AnyObject])
            dataArray.append(homeModel)
        }
    }
    
    //头部滑动加载
    func p_loadTopScrollView(){
    
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        view.backgroundColor = UIColor.lightGray
        self.view.addSubview(view)
        //底部视图
        footView = UIView.init(frame: CGRect.init(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 200 - 49))
        self.view.addSubview(footView!)
    }
    //表试图加载
    func p_loadTableView(){
    
        tableView = HomeTableView.init(frame: CGRect.init(x: 0, y: 0, width: (footView?.frame.size.width)!, height: (footView?.frame.size.height)!))
        tableView?.delegate = self
        tableView?.dataArray = dataArray
        footView?.addSubview(tableView!)
    }
    //九宫格视图
    func p_loadCollectionView(){
    
        collectionView = HomeCollectionView.init(frame: CGRect.init(x: 0, y: 0, width: (footView?.frame.size.width)!, height: (footView?.frame.size.height)!))
        collectionView?.delegate = self
        collectionView?.dataArray = dataArray
        footView?.addSubview(collectionView!)
    }

    //选择显示哪个视图,默认九宫格
    @IBAction func clickControl(_ sender: UISegmentedControl) {
        //交换视图的等级
        let views = footView?.subviews
        let front = views?[1]
        let back = views?[0]
        //动画转变
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.easeInOut)
        front?.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        back?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        footView?.exchangeSubview(at: 0, withSubviewAt: 1)
        
        UIView.commitAnimations()
    }
    
    //自定义代理
    //传递点击的内容给vc
    func tranDataToVC(item:HomeModel){
    
        self.p_pushShowVC(model:item )
    }
    //传递点击内容
    func tranCollectionViewDataToVC(item:HomeModel){
    
        self.p_pushShowVC(model:item )
    }
    
    //跳转控制器
    func p_pushShowVC(model:HomeModel){
    
        self.hidesBottomBarWhenPushed = true
        let showVC:ShowViewController = ShowViewController.init()
        showVC.title = model.name
        showVC.model = model
        self.navigationController?.pushViewController(showVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
}
