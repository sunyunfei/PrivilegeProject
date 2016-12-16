//
//  ShowModel.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class ShowModel: NSObject {

    var icon:String?//头像
    var price:String?//价钱
    var active:String?//折扣
    var name:String?//标题
    var des:String?//总描述
    var type:String?//类别
    var des2:String?//分描述
    var des3:String?//分描述
    var image:String?//图片
    //加载数据
    init(dic:[String:AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
}
