//
//  HomeModel.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    var icon:String?//图片
    var name:String?//标题
    //加载数据
    init(dic:[String:AnyObject]) {
        
        self.icon = dic["icon"] as! String?
        self.name = dic["name"] as! String?
    }
}
