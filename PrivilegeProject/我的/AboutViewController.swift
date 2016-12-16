//
//  AboutViewController.swift
//  PrivilegeProject
//
//  Created by 孙云飞 on 2016/12/16.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var label:UILabel?
    var titleInt:Int!{
    
        didSet{
        
            self.p_updateUI()
        }
    }//显示的时间
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func p_updateUI(){
    
        label = UILabel.init(frame: self.view.bounds)
        label?.font = UIFont.systemFont(ofSize: 25)
        label?.textColor = UIColor.lightGray
        label?.numberOfLines = 0
        label?.textAlignment = .center
        self.view.addSubview(label!)
        
        var str = ""
        switch titleInt {
        case 0:
            str = "尊敬的客户你好:您还没有收藏物品"
            break
        case 1:
            str = "尊敬的客户你好:您钱包余额为：0"
            break
        case 2:
            str = "尊敬的客户你好:您暂时还没有卡券"
            break
            
        default:
            break
        }
        label?.text = str
    }

}
