//
//  HomeCollectionView.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit
protocol HomeCollectionViewDelegate {
    
    func tranCollectionViewDataToVC(item:HomeModel)//传递点击内容
}
class HomeCollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource{

    var collectionView:UICollectionView?//九宫格
    var dataArray:[HomeModel]?
    var delegate:HomeCollectionViewDelegate?// 代理
    
    //初始化方法
   override init(frame: CGRect) {
    
     super.init(frame: frame)
    
     //加载九宫格
     self.p_loadCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //九宫格加载方法
    func p_loadCollectionView(){
    
        //九宫格的显示格式
        let fy = UICollectionViewFlowLayout.init()
        fy.itemSize = CGSize.init(width: self.frame.size.width / 3 - 8, height: self.frame.size.width / 3)
        fy.sectionInset = UIEdgeInsets.init(top: 1, left: 2, bottom: 1, right: 2)
        //九宫格创建
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: fy)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        //注册cell
        collectionView?.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        self.addSubview(collectionView!)
    }
    
    //代理
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.homeModel = dataArray?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.tranCollectionViewDataToVC(item: (dataArray?[indexPath.row])!)
    }
}
